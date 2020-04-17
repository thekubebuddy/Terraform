Table of Content
=================
* [What is terraform](#what-to-know-about-terraform-before-starting)
* [Launch Aws ec2 instance with terraform\(hello-world\)](aws/hello-ec2)
* [Launch simple VPC with terraform](aws/hello-vpc)
* [Launch VPC with dynamic subnets provisioning terraform](aws/dynamic-vpc)


# About Terraform

1. Its Tool for building, changing and versioning infrastructure safely and efficiently.
2. Terraform similar to google's deployment manager or AWS's Cloud Formation stack which are native
to those cloud Platform.
3. Benifits of Terraform:
	* IaaC
	* execution plan
	* Chnage Automation
4. Widely used by major public cloud platform, it one-stop shop for our needs, supporting numerous major 
services within the selected  cloud provider.
5. Supported for Multi-cloud Developement
6. It Uses HCL(hashicorp config. language), which is json compatible
7. Large comminity of Support, it chnged the way we work in DevOps

# Understanding init, plan and apply

8.1 terraform init
* It is used to initialize any working directory which contains the config file (\*.tf) 
* It also hightlight if any error present in the configuration file

8.2 terraform plan
* Its basically shows the execution plan for the infrastructure which will going deployed.
* "terrafor plan" looks for the config files withing the current dir. and state file to refresh
"terraformstate.tf file"
* plan must be run before commiting/exucuting any real world chnge i.e before "terraform apply", so as to know how exactly things
will going to be changed


8.3 terraform apply
* It will apply the chnges to the infrastructure which is generated from the "execution plan"
* Thts why its good practice to "terraform plan" before "terraform apply"


* Typical files for terraform:	
	+ Config_file
		- main.tf
		- var.tf/variable.tf

### Terraform var.tf sample:
```
variable "project"{
	default="my-project-1"
}
variable "zones"
{	
	type=list(string)
	default="us-"
}

```

* Terraform support three different types of format for variables: string, list, map

# Terraform cheetsheets
```
terraform init
terraform apply
terraform apply -auto-approve
terraform state list
terraform validate # vlidates all of the configuration file
terraform destroy--> flushing all of the infra
terraform console  # getting the terraform infra console
terraform taint #Manually marks a resource for recreation
terraform untaint #Manually unmarks a resource as tainted
terraform validate #Validates the Terraform files
terraform version #Prints the Terraform version
terraform workspace #Workspace management

export TF_LOG= 
```

* Reusable configurations called as module, that can be reused from other terraform script


