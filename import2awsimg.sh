#!/bin/bash

# FimgDemo AWA Image Importer

#Procedure to import an image
#1) install aws cli
#---https://docs.aws.amazon.com/cli/latest/userguide/installing.html
#2) config aws cli
#3) create vmimport role
#---https://docs.aws.amazon.com/vm-import/latest/userguide/vmie_prereqs.html#vmimport-role
#4)create bucket and attach policy
#---refer to https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html#vmimport-iam-permissions


usage()
{
	echo "Usage $0 <imported_image_file> <s3_bucket_name>"
	echo ""
	echo "Example ./import2awsimg.sh FimgDemo-AWS.vhd bucket"
}

check_S3()
{
	if ! type aws >/dev/null;then
		echo "Please install aws cli first"
		echo "refer https://docs.aws.amazon.com/cli/latest/userguide/installing.html"
		exit 1
	fi
	aws s3 ls s3://$1 >/dev/null
	if [ $? -ne 0 ];then
		echo "The bucker $1 not exist or the wrong AWS CLI configuration."
		exit 1
	fi
}

#refer to https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html#vmimport-iam-permissions
create_vmimport_role_and_policy()
{
cat <<EOF > trust-policy.json
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Principal": { "Service": "vmie.amazonaws.com" },
         "Action": "sts:AssumeRole",
         "Condition": {
            "StringEquals":{
               "sts:Externalid": "vmimport"
            }
         }
      }
   ]
}
EOF

aws iam create-role --role-name vmimport --assume-role-policy-document file://trust-policy.json
rm -f trust-policy.json

cat <<EOF > role-policy.json
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket"
         ],
         "Resource":[
            "arn:aws:s3:::$s3BacketName",
            "arn:aws:s3:::$s3BacketName/*"
         ]
      },
      {
         "Effect":"Allow",
         "Action":[
            "ec2:ModifySnapshotAttribute",
            "ec2:CopySnapshot",
            "ec2:RegisterImage",
            "ec2:Describe*"
         ],
         "Resource":"*"
      }
   ]
}
EOF

aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document file://role-policy.json
rm -f role-policy.json
}


# reference https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-import-snapshot.html
import_image()
{
	imageName=$(basename "$imageFile")
	amiName="${imageName%.*}"
	# Upload image file to S3
	echo "Upload image file to S3.."
	aws s3 cp $imageFile s3://$s3BacketName/$imageName

cat <<EOF > container.json
{
    "Description": "FAC AWS",
    "Format": "vhd",
    "UserBucket": {
        "S3Bucket": "$s3BacketName",
        "S3Key": "$imageName"
    }
}
EOF

	# Import image file as snapshot
	echo "Start import image file as snapshot.."
	import_task_id=$(aws ec2 import-snapshot --description "Fimg aws" --disk-container file://container.json | awk -F '"' '{if($2=="ImportTaskId")print $4}')
	if [ -z "$import_task_id" ]; then
		echo "Import Failed"
		rm -f *.json
		exit 1
	else
		echo $import_task_id
	fi

	# Waiting for import-snapshot
	while true
	do
		result=$(aws ec2 describe-import-snapshot-tasks --import-task-ids $import_task_id)
		Status=$(echo "$result"|awk -F '"' '{if($2=="Status")print $4}')
		Progress=$(echo "$result"|awk -F '"' '{if($2=="Progress")print $4}')
		echo "ImportSnapshotTask status: $Status, progress: $Progress"

		if  [ $Status = "completed" ];then
			snapshotId=$(echo "$result" | awk -F '"' '{if($2=="SnapshotId")print $4}')
			echo "Done. SnapshotId: $snapshotId"
			break
		fi

		if  [ $Status = "deleted" ];then
			resMessage=$(echo "$result"|awk -F '"' '{if($2=="StatusMessage")print $4}')
			echo "Import snapshot Failed."
			[ -n "$resMessage" ] && echo "$resMessage"
			rm -f *.json
			exit 1
		fi
		sleep 10
	done

	aws ec2 create-tags --resources $snapshotId --tags Key="Name",Value="$amiName"

cat <<EOF > block_device_mappings.json
[
  {
    "DeviceName": "/dev/sda1",
    "Ebs": {
      "SnapshotId": "$snapshotId",
      "VolumeType": "gp2"
    }
  },
  {
    "DeviceName": "/dev/sdb",
    "Ebs": {
      "VolumeSize": 10,
      "DeleteOnTermination": true,
      "VolumeType": "gp2"
    }
  }
]
EOF
	echo "register AMI.."
	amiId=$(aws ec2 register-image --name $amiName --architecture x86_64 \
		--root-device-name /dev/sda1 --virtualization-type hvm \
		--block-device-mappings file://block_device_mappings.json \
		| awk -F '"' '{if($2=="ImageId")print $4}')

	if  [ -z "$amiId" ];then
		echo "Register AMI Failed"
		rm -f *.json
		exit 1
	fi
	aws ec2 create-tags --resources $amiId --tags Key="Name",Value="$amiName"

	echo "Register AMI done.."
	echo "AMI ID: $amiId"
	echo "AMI NAME: $amiName"
	rm -f *.json
}

if [ $# -gt 1 ];then
	imageFile=$1
	s3BacketName=$2
else
	usage
fi

if [ ! -f "$imageFile" ];then
	echo "Image file $imageFile does not exist!"
	exit 1
fi

check_S3 $s3BacketName

# create vmimport role and attach policy. This requires IAM permissions.
# Need to be executed in the script, please remove the following "#"
#create_vmimport_role_and_policy

import_image
