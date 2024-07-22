# Public Cloud Fortinet Deployment Guide Reference:

ADC:
https://docs.fortinet.com/product/fortiadc-public-cloud

## Fortinet Azure References ##


A set of Azure most requested Templates for getting you started in Fortinet Azure deployments.


**Azure Active Directory single sign-on (SSO) integration with FortiGate SSL VPN**
* 
```
https://docs.microsoft.com/en-us/azure/active-directory/saas-apps/fortigate-ssl-vpn-tutorial
```

**FortiGate - Azure: FG A/P + Azure (ELB & ILB) in Single or Dual-AZ**
* 
```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiGate/Active-Passive-ELB-ILB
```

**FortiGate - Azure: FG A/A + Azure (ELB & ILB) in Single or Dual-AZ**

Active/Active with Load Balancer (External and/or Internal)
```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiGate/Active-Active-ELB-ILB
```

**FortiGate - Azure: GWLB**

* Change MtU to:1570
```
https://fusecommunity.fortinet.com/blogs/daniel1/2021/10/19/deploy-fortigate-with-azure-gateway
```

**FortiGate - Azure: FG-AutoScale deployment template**
```
https://github.com/fortinet/fortigate-autoscale-azure
```
* Troubelshooting: Function App --> Log stream.
* Make sure to upload TWO folders:
* Specify the folder to upload to in Upload to folder:
***For configset files, enter assets/configset.
***For license files, enter assets/license-files/fortigate.

  https://docs.fortinet.com/document/fortigate-public-cloud/7.4.0/azure-administration-guide/844072/uploading-files-to-the-storage-account

**Fortinet - Azure Stack useful links**

```
https://learn.microsoft.com/en-us/azure-stack/user/azure-stack-network-differences?view=azs-2206
```
```
https://learn.microsoft.com/en-us/azure-stack/operator/azure-stack-marketplace-azure-items?view=azs-2206
```
```
https://learn.microsoft.com/en-us/azure-stack/operator/azure-stack-network-solutions-enable?view=azs-2206
```
```
https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/azure-administration-guide/419755/sdn-connector-in-azure-stack
```
```
https://docs.fortinet.com/document/fortiweb-public-cloud/6.4.0/deploying-fortiweb-vm-on-azure-stack/505675/obtaining-the-deployment-image
```

**FortiGate - Azure Stack deployment**
* You can deploy to ASDK or use: Azure deploy.json —> Raw (copy)
```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiGate/AzureStackHub/Active-Passive-SDN
```


**FortiWeb - Azure: FortiWeb A/A + Azure (ELB or ILB) in Single or Dual-AZ**

* Mode: FWB A/A: High volume active-active HA group Supports up to 8 * FWB in A/A for full config sync.

```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiWeb/Active-Active
```
* Template Guide: FWB A/A + ILB:  For Internal Load Balancer: Choose none from drop down list. (From the Public IP New or Existing) .


**FortiWeb - Azure: FortiWeb AutoScale**:

```
https://github.com/fortinet/fortiweb-autoscale/releases/tag/1.0.10
```

* Main Github: 
```
https://github.com/fortinet/fortiweb-autoscale
```

* Main docs: 

```
https://docs.fortinet.com/document/fortiweb-public-cloud/latest/deploying-auto-scaling-on-azure/697600/deploying-autoscaling-resources-using-arm-templates

https://docs.fortinet.com/document/fortiweb-public-cloud/6.4.0/deploying-auto-scaling-on-azure/697600/deploying-autoscaling-resources-using-arm-templates
```

**FortiWeb - Azure: FortiWeb A.P**:

* Notes:

* SDN is used for Failover which requires: App Registration under Azure AD and IAM role under Subscription for that App (Service Principal). 
* Value ID = Client Secret in the APP Registration for the Service Principal.
* Service Principal for the App-VM will require IAM Role with Contributor.
* Backend Pool will be one FWB and during failover automatically backened on ELB will change to the active FortiWeb. 
* Make sure backend pool (NIC/IP) and heartbeat used for A.P are using same Interface.


* Guide:
```
https://docs.fortinet.com/document/fortiweb-public-cloud/latest/use-case-high-availability-for-fortiweb-on-azure/277766/overview
```
```
https://docs.fortinet.com/document/fortiweb/7.0.1/administration-guide/435480/synchronization
```

* Deployment:

```
https://github.com/fortinet/fortiweb-ha
```

```
https://github.com/fortinet/fortiweb-ha/blob/main/azure/templates/deploy_fwb_ha.json
```
* Copy Raw code to Azure Template and then deploy it.
* if no license uploaded during FWB BYOL template, it will not be able to deploy A.P (it will stay Standlaone, A.P requires Licensed FWB). 

**FortiSandbox - Azure: Advanced Deployment**:

* Recommended Instance Shape: In general for BYOL 8 clones: 8 vCPU/ 16GB Virtual RAM / 500GB Virtual Storage.
Worker Nodes:
https://docs.fortinet.com/document/fortisandbox-private-cloud/4.2.0/vmware-esxi-vm-install-guide/328669/minimum-system-requirements

* Primary/Seconday: Recommended Instance Shape: In general for up to 6 workers: 8 vCPU/ 16GB Virtual RAM / 500GB Virtual Storage.
https://docs.fortinet.com/document/fortisandbox/4.2.0/best-practices/330135/setting-up-a-fortisandbox-vm00-as-primary-node-for-high-availability



* Deployment: (mainTemplate.json)

```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiSandbox/Advanced-Deployment
```

* default login: admin / az vm list --output tsv -g resource-group (Azure PowerShell)
* From Github Template you can choose up tp 8 *FSA-VM in an Advanced Standalone Mode at one time. (AS or AZ).

```
* Supports custom Windows VMs on Azure (unknown Files stay on Azure for inspection).
* Supports HA features.
* Gives you full control to customize the resources required to deploy the VM.
* You can use PreBuilt Custom VMs ( Windows and Linux).
```
Guide:

```
https://docs.fortinet.com/document/fortisandbox-public-cloud/4.0.0/fortisandbox-vm-on-azure/963045/deploying-fortisandbox-vm-on-azure-advanced
```
``` 
https://www.youtube.com/watch?v=7VPZ84cV-jA
```


**FortiMail - Azure: HA**:

**FortiAnalyzer - Azure:**:

``` 
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiAnalyzer/single-1nic
``` 

**FortiManager - Azure:**:

``` 
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiManager/single-1nic
``` 
** Note: You need to fill exact Vnet-name, CIDR and FMG pre-created subnet for existing Vnet **


<br /> 
<br /> 


## Fortinet OCI References ##

A set of OCI most requested Templates for getting you started in Fortinet OCI deployments.

**FortiGate - OCI: FG A/P  in Single AD and Dual FD**
```
https://github.com/hkebbi/fortinet-oci-solutions/tree/master/FortiGate/Single_AD_Dual_FD
```

**FortiGate - OCI: FG A/P  in Dual AD and Dual FD**
```
https://github.com/hkebbi/fortinet-oci-solutions/tree/master/FortiGate/Dual_AD-Dual_FD
```

```
** Note: Supports Private API call**
```
**FortiGate - OCI: FG A/A  in Dual AD and Dual FD**

**FortiWeb - OCI: FortiWeb A/A + OCI (ELB or ILB) in Single or Dual-AZ**

**FortiMail - OCI: HA**:

* FortiMail Deployment: 
```
https://docs.fortinet.com/document/fortimail/7.0.0/oci-deployment-guide
```

* FortiMail HA FML A/P Deplopyment: 
```
https://docs.fortinet.com/document/fortimail/7.0.0/fortimail-ha-on-oci-deployment-guide
```

```
** Note: FML A/P (Primary / Secondary)
 - FortiMail Active-Passive HA + OCI Load Balancer (only the Active FML will respond).
 - OCI loadbalancer will check their healthy status of port 25 to distribute the mail traffic. 
      Example: User-SMTP---> OCI-LB ---> FML-HA ---> Server
```

**FortiAnalyzer - OCI: HA**:

**FortiManager - OCI: HA**:

<br /> 
<br /> 


## Fortinet AWS References ##
```
A set of AWS most requested Templates for getting you started in Fortinet AWS deployments.
```
**AWS Maximum Interfaces & IP addresses per instance Shape**
* https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI


**FortiGate - AWS: FG A/P MultiZone**
* https://github.com/40net-cloud/fortinet-aws-solutions/tree/master/FortiGate/Active-Passive-Multi-Zone

```
**Note: Supports Private API call**
```

**FortiGate - AWS: FG A/A + GWLB**
* Deployment: https://github.com/40net-cloud/fortinet-aws-solutions/tree/master/FortiGate/GWLB
* Design: https://github.com/40net-cloud/fortinet-aws-solutions/tree/master/FortiGate/GWLB/6.4

**FortiWeb - AWS: FortiWeb A/P & FortiWeb A/A + AWS (ELB or ILB) in Single or Dual-AZ**

* Guide: https://docs.fortinet.com/document/fortiweb-public-cloud/latest/use-case-high-availability-for-fortiweb-on-aws/556435/overview
* Deployment: https://github.com/fortinet/fortiweb-ha/tree/main/aws/cloudformation

**FortiSandbox - AWS: Advanced Deployment**:

**FortiMail - AWS: HA**:

**FortiAnalyzer - AWS: HA**:

**FortiManager - AWS: HA**:

<br /> 
<br /> 


## Fortinet GCP References ##

FortiGate architecture in Google Cloud: https://cloud.google.com/architecture/partners/fortigate-architecture-in-cloud
```
A set of GCP most requested Templates for getting you started in Fortinet GCP deployments.
 * Solutions Includes: FG, FML, FPX, FWB, FWBVaaS, FAZ & FMG
```

```
Latest Existing FG A.P Terraform (Examples):
https://github.com/fortinet/terraform-google-fgt-ha-ap-lb
```

```
Latest  New VPC FG A.A Terraform:
https://github.com/fortidg/gcp-fgt-a_a
```

```
Latest  Existing FG A.A Terraform:
https://github.com/fortidg/gcp-fgt-a_a_existing
```


**FortiWeb - GCP: HA**
```
https://github.com/fortinet/fortiweb-ha/tree/main/gcp/terraform

https://github.com/fortinet/fortiweb-ha/releases/tag/1.0.14
```

**Others: FortiGate HA - Egress Inspection /w custom-route using network-tag in GCP Per VM**
```
https://github.com/ozanoguz/gcp-customroute_by_nwtag
```

**FortiMail - GCP Manual Deployment Guide**

```
https://fortinetweb.s3.amazonaws.com/docs.fortinet.com/v2/attachments/fef568b6-c551-11eb-97f7-00505692583a/FortiMail_GCP_Deployment_Guide.pdf
```

**FortiProxy - GCP Deployment Guide**

FPX-Manual Deployment :
```
https://docs.fortinet.com/product/fortiproxy-public-cloud/7.0
```

FPX-Template:
```
https://github.com/40net-cloud/fortinet-gcp-solutions/tree/master/FortiProxy/dm
```

<br /> 
<br /> 


## Fortinet SaaS Public Cloud ##

**FortiWeb Cloud**
* Docs Reference: https://docs.fortinet.com/product/fortiweb-cloud
* Explore Live Demo: https://www.fortiweb-cloud.com/index/login

**FortiGSLB**
* Docs Reference: https://docs.fortinet.com/product/fortiadc-cloud

**FortiCNP & FortiCNP Container Protection**
* Docs Reference: https://docs.fortinet.com/product/forticwp/22.1

**FortiMonitor**
* Docs Reference: https://docs.fortinet.com/product/fortimonitor/22.1

**FortiDevSec**
* Docs Reference: https://docs.fortinet.com/product/fortidevsec/22.1
* Explore Live Demo: https://fortidevsec.forticloud.com/#/login


## Fortinet Microservices & DevOps References ##
```
A set of Container most requested Templates for getting you started in Fortinet Container & DevOps deployments.
```
**Kubernetes K8S SDN connector requirements**

FortiADC Ingress :
```
https://github.com/fortinet/fortiadc-ingress
```
* https://training.kubiosec.tech/labs/lab11/
* https://github.com/ozanoguz/fgt-sdn-connector-eks-egress
* https://github.com/xxradar/app_routable_demo





<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 
<br /> 

**Support**
Provided scripts in this and other GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services. For direct issues, please refer to the Issues tab of this GitHub project.

**DISCLAIMER**: 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
Fortinet-provided scripts in this  GitHub projects do not fall under the regular Fortinet technical support scope and are not supported by FortiCare Support Services.
This Github is for informational purposes only. 




