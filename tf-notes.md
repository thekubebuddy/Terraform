1. Provider dependencies are created in several different ways:  - Important
* Explicit use of a provider block in configuration, optionally including a version constraint.       
* Use of any resource belonging to a particular provider in a resource or data block in configuration.       
* Existence of any resource instance belonging to a particular provider in the current state. For example, 
* if a particular resource is removed from the configuration, it continues to create a dependency on its provider until its instances have been destroyed. 

2. Remote backend deletion:
If the remote backend got deleted, than terraform apply command will error out. You need to reinitialize Terraform again, and it will prompt you to migrate existing remote state to the local backend so that it can still manage resources managed by the remote state.

3. Module Sources: The source argument in a module block tells Terraform where to find the source code for the desired child module. 
A module can be public or private. 
The module installer supports installation from a number of different source types, as listed below.
*  Local paths
*  Terraform Registry
*  GitHub
*  Bitbucket
* Generic Git, Mercurial repositories
*  HTTP URLs
*  S3 buckets
*  GCS buckets

4.  tf state locking: You can disable state locking for most commands with the -lock flag but it is not recommended. 
If acquiring the lock is taking longer than expected, Terraform will output a status message. 
If Terraform doesn't output a message, state locking is still occurring if your backend supports it.

5. tf show
The terraform show command is used to provide human-readable output from a state or plan file. This can be used to inspect a plan to ensure that the planned operations are expected, or to inspect the current state as Terraform sees it

6. A module can not access all parent module variables; hence to pass variables to a child module, the calling module should pass specific values in the module block. 
Sample Example: 
```
module "servers" 
{ 
source = "./app-cluster" 
servers = 5 
} 
A module that includes a module block like this is the calling module of the child module.
```

7. **Terraform use cases
https://www.terraform.io/intro/use-cases.html 

8. **sentinel policy as code
Sentinel Policy as Code Sentinel is a policy as a code framework that’s integrated into Hashicorp enterprise products. 
Sentinel allows users to define policies that are enforced against infrastructure between the plan and apply phases of a Terraform run

9. The “Terraform provisioner block“ works only within the resource configuration block.
10. In Terraform 0.12  terraform init cannot automatically download third-party providers.
11. Terraform v0.12 terraform provider code snippet
```
terraform {
required_providers {
aws = {
source = “hashicorp/aws”
version = “3.1.0” # optional
}
}
}
```

12. Additional provider configurations(those with alias) are never inherited automatically by child modules. - True

13. Terraform Enterprise is our self-hosted distribution of Terraform Cloud. Features of which are **audit logging and SAML single sign-on.**

14. **Race around condition

15. **Implicit dependencies & explicit dependencies

16. Run scripts inside a provisioner block without being attached to any “real” resource.?
Yes, by defining provisioners on a "null_resource"

17. **Terraform variable precendency
*  Environment variables
*  The terraform.tfvars file, if present.
*  The terraform.tfvars.json file, if present.
*  Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
*  Any -var and -var-file options on the command line, in the order they are provided.
    (This includes variables set by a Terraform Cloud workspace.)

18. Providers Within Modules - Read it.

19. The terraform plan command is used to create an execution plan. 
**Terraform performs a refresh, unless explicitly disabled**, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

20.  **Benefits of backends in terraform?
  * Working in Team
  * Remote Operations
  * Keeping sensitive information off disk

21. tf validate -  syntactically valid and internally consistent?

22. Is it not compulsory to provide a version constraint string to pull module from the Terraform registry. 
```
terraform {
required_providers {
aws = {
source = “hashicorp/aws”
version = “3.1.0” # optional but recommended
}
}
}
```

 
23. The "required_version" setting applies only to the version of Terraform CLI. 
The "required_providers" block to manage the expected versions for each provider you use.


24. resource declaration:
```
resource “aws_instance” “web” {
ami = “ami-a1b2c3d4”
instance_type = “t2.micro”
}
```
**A resource block declares a resource of a given type (“aws_instance”) with a given local name (“web”). The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside that module’s scope.**

25. Lastly

- Policy As code - Sentinel support
- Terraform Enterprise – Self Hosted
- Terraform Cloud – Team & Governance
