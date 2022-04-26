# Public Cloud Fortinet Deployment Guide Reference:


## Fortinet Azure References ##


A set of Azure most requested Templates for getting you started in Fortinet Azure deployments.


**FortiGate - Azure: FG A/P + Azure (ELB & ILB) in Single or Dual-AZ**
* 
```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiGate/Active-Passive-ELB-ILB
```

**FortiGate - Azure: FG A/A + Azure (ELB & ILB) in Single or Dual-AZ**

```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiGate/Active-Active-ELB-ILB
```

**FortiGate - Azure: FG-AutoScale deployment template**
```
https://github.com/fortinet/fortigate-autoscale-azure
```

**FortiWeb - Azure: FortiWeb A/A + Azure (ELB or ILB) in Single or Dual-AZ**

```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiWeb/Active-Active

```
* FWB A/A + ILB:  For Internal Load Balancer: Choose none from drop down list. (From the Public IP New or Existing) .

**FortiWeb - Azure: FortiWeb AutoScale**:

```
https://docs.fortinet.com/document/fortiweb-public-cloud/latest/deploying-auto-scaling-on-azure/697600/deploying-autoscaling-resources-using-arm-templates
```
* Main Github: 

```
https://github.com/fortinet/fortiweb-autoscale
```

**FortiSandbox - Azure: Advanced Deployment**:

* Deployment: (mainTemplate.json)

```
https://github.com/40net-cloud/fortinet-azure-solutions/tree/main/FortiSandbox/Advanced%20Deployment
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
 * https://docs.fortinet.com/document/fortisandbox-public-cloud/4.0.0/fortisandbox-vm-on-azure/963045/deploying-fortisandbox-vm-on-azure-advanced
 * https://www.youtube.com/watch?v=7VPZ84cV-jA

**FortiMail - Azure: HA**:

**FortiAnalyzer - Azure: HA**:

**FortiManager - Azure: HA**:

<br /> 
<br /> 


## Fortinet OCI References ##
```
A set of OCI most requested Templates for getting you started in Fortinet OCI deployments.
```

**FortiGate - OCI: FG A/P  in Single AD and Dual FD**
* https://github.com/hkebbi/fortinet-oci-solutions/tree/master/FortiGate/Single_AD_Dual_FD

**FortiGate - OCI: FG A/P  in Dual AD and Dual FD**
* https://github.com/hkebbi/fortinet-oci-solutions/tree/master/FortiGate/Dual_AD-Dual_FD

```
** Note: Supports Private API call**
```
**FortiGate - OCI: FG A/A  in Dual AD and Dual FD**

**FortiWeb - OCI: FortiWeb A/A + OCI (ELB or ILB) in Single or Dual-AZ**

**FortiMail - OCI: HA**:

* FortiMail Deployment: https://docs.fortinet.com/document/fortimail/7.0.0/oci-deployment-guide
* FortiMail HA FML A/P Deplopyment: https://docs.fortinet.com/document/fortimail/7.0.0/fortimail-ha-on-oci-deployment-guide

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
* Guide: https://fortinetweb.s3.amazonaws.com/docs.fortinet.com/v2/attachments/f6e3aa24-f317-11e8-b86b-00505692583a/Use_Case_-_High_Availability_for_FortiWeb_on_AWS.pdf

* Deployment: https://github.com/fortinet/fortiweb-ha/tree/main/aws

**FortiSandbox - AWS: Advanced Deployment**:

**FortiMail - AWS: HA**:

**FortiAnalyzer - AWS: HA**:

**FortiManager - AWS: HA**:

<br /> 
<br /> 


## Fortinet GCP References ##
```
A set of GCP most requested Templates for getting you started in Fortinet GCP deployments.
```

<br /> 
<br /> 


## Fortinet SaaS Public Cloud ##


**FortiWeb Cloud**
* Docs Reference: https://docs.fortinet.com/product/fortiweb-cloud
* Explore Live Demo: https://www.fortiweb-cloud.com/index/login

**FortiGSLB**
* Docs Reference: https://docs.fortinet.com/product/fortiadc-cloud

**FortiCWP & FortiCWP Container Protection**
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

* https://training.kubiosec.tech/labs/lab11/



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




