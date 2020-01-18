### We are provisioning a VPC with dynamic subnets creation, it demostrate the use of 
- list
- [count](https://www.terraform.io/intro/examples/count.html) parameter
- [count.index]https://www.terraform.io/docs/configuration/functions/index.html(https://www.terraform.io/docs/configuration/functions/index.html)
- [element](https://www.terraform.io/docs/configuration/functions/element.html)
- [length](https://www.terraform.io/docs/configuration/functions/length.html)
- [replace](https://www.terraform.io/docs/configuration/functions/replace.html)  function and also 
- [datasources](https://www.terraform.io/docs/providers/aws/d/availability_zones.html)

* Each subnet will be created in different AZ dynamically for that we made use of datasource in vars.tf


* Here below are some end result:

### Subnets created with dynamic cidr blocks but some are deployed to the same AZ's 

![dynamic-subnets-in-same-az](same-azs.png)


### Subnets created with dynamic cidr blocks also deployed evenly to the different AZ's 

![dynamic-subnets-in-different-az](same-azs.png)
