Table of Content
=================
* [What is terraform](#what-to-know-about-terraform-before-starting)
* [Launch Aws ec2 instance with terraform\(hello-world\)](aws/hello-ec2)
* [Launch simple VPC with terraform](aws/hello-vpc)
* [Launch VPC with dynamic subnets provisioning terraform](aws/dynamic-vpc)
* [Terraform cheetsheet](#terraform-cheetsheets)

### About Terraform

1. Its Tool for building, changing and versioning infrastructure safely and efficiently.
Blue-print for the datacenter
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

#### [Terraform Workflow](https://youtu.be/h970ZBgKINg)

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



### Output and Input variables for terraform
```
output "external_ip"
{
	value=ec2_instance.instance_name.external_ip
}
```
```
variable "instance_name"
{
	default="prod-ec2-instance"
}
```
```
terraform apply  'instance_name=prod-ec2-instance-1'
terraform destroy  'instance_name=prod-ec2-instance-1'
```

### Terraform cheetsheets
```
# upgrading the modules & downloading the latest providers
terraform init -upgrade 

# terraform init with backend initialization & module code download skipping the plugin
terraform init -get-plugin=false 

# Reusing or sourcing the pre-downloaded the provider plugins for terraform code(storage efficient initialization)
terraform init -plugin-dir=/path/to/the/dir/terraform.d/plugins/x86_64


#  Reviewing the changes with saving the plan output to the "tfplan" file, with "colorless" console output(CI usecase)
terraform plan -out tfplan -no-color 

# Applying the state file with no approval
terraform apply tfplan 

# Populating the destroy plane for the know tf managed resources
terraform plan -destroy 

# Applying the infra changes with auto-approving request, with parralelism level 20 with no refreshing the state
terraform apply -auto-approve -parralelism=20 -refresh=false

# List all of the resources within the tf state file
terraform state list

# Reviewing the state for a particular resource within the state file 
terraform state show <resourc-id>

# Validating all of the configuration file
terraform validate 

# Canonically formating the terraform configuration file
terraform fmt 
terraform fmt -recursive=true -write=false

# Destroying the provisioned resources
terraform destroy 

# Interactive tf console for the interpolation experimentations. 
terraform console  

# Manually marks a resource for recreation in the next apply
terraform taint <resource-id> 

# Manually unmarks a resource as tainted resources
terraform untaint <resource-id>

# List all of the providers being used for the terraform code
terraform provider

# Same code different state file
terraform workspace list/show/new/select/delete

# Importing an un-managed resource
terraform import <config-resource-ref> <actual-resource-self-link>

# For setting the detailed logging during plan or apply.
export TF_LOG="TRACE" #TRANCE, DEBUG, INFO, WARN, RANDOM

# Exporting the logs for a particular plan,apply
export TF_LOG_PATH="./tf-plan.log"

# Setting the variables value as env variables, which can be used while tf plan & apply  
export TF_VAR_account_id="acc-1234hello" 

# will specify additional arguments to the command-line. For example
export TF_CLI_ARGS_apply="-refresh=false" 



# bash autocomplete
terraform -install-autocomplete
terraform -uninstall-autocomplete
```


### Scratch Pad
```hcl
[ for k,v in local.vnet_yaml_data : k ]
[ for network_key, network in local.vnet_yaml_data : network_key]
[ for network_key, network in local.vnet_yaml_data : network]
[ for network_key, network in local.vnet_yaml_data : [for subnet in network.Subnets : subnet.Name] ]
[ for subnet in local.vnet_yaml_data.k8s-vnet.Subnets : { name = subnet.Name } ]
[ for subnet in local.vnet_yaml_data.k8s-vnet.Subnets : { name = subnet.Name, cidr_address = cidrsubnet("10.12.0.0/16", 8, subnet.Priority) } ]
[ for network_key, network in local.vnet_yaml_data : [ for subnet in network.Subnets : { name = subnet.Name, cidr_address = cidrsubnet(network.AddressSpace, 8, subnet.Priority), vnet = network_key } ] if network_key != "hub-vnet" ]
[ for network_key, network in local.vnet_yaml_data : [ for subnet in network.Subnets : { name = subnet.Name, cidr_address = cidrsubnet(network.AddressSpace, 8, subnet.Priority), vnet = network_key } ] ]


[ for k,v in local.pg_roles_map : k ]
{ for k,v in local.pg_roles_map : k=>v }
[ for role_key,roles in local.pg_roles_map : role_key ]
[ for role_key, network in local.pg_roles_map : network_key if network_key != "hub-vnet" ]
[ for role_key,roles in local.pg_roles_map : role_key if role_key != "role_dba" ]
# Get all of users_role from the "pg_roles_map"
flatten([ for network_key, network in local.vnet_json_data : network.Subnets ])
flatten([ for role_key, roles in local.pg_roles_map : roles.pg_users_role ])
# Getting the already created role_names(keys)
[ for subnet in local.vnet_json_data.k8s-vnet.Subnets : subnet.Name ]
[ for role_key,roles in local.pg_roles_map : role_key ]
# Getting 
flatten([ for role_key, roles in local.pg_roles_map : {name=role_key, user_roles=roles.pg_users_role, pg_role_passwd=roles.pg_role_passwd, pg_role_validity=roles.pg_role_validity} ])
flatten([ for role_key, roles in local.pg_roles_map : {name=role_key, user_roles=roles.pg_users_role} ])
{ for role_key, roles in local.pg_roles_map : role_key=>roles.pg_users_role }
**map-one
flatten([ for role_key, roles in local.pg_roles_map : {db_role=role_key, user_roles=roles.pg_users_role} ])
** total-roles that needs to be created:
total_role=flatten([ for role_key, roles in local.pg_roles_map : roles.pg_users_role ])
```

#### Reference:
```
https://serverfault.com/questions/833810/terraform-use-nested-loops-with-count
https://github.com/hashicorp/terraform/issues/22263#issuecomment-563320529
https://discuss.hashicorp.com/t/produce-maps-from-list-of-strings-of-a-map/2197
https://stackoverflow.com/questions/62679195/terraform-looping-in-list-of-map
```