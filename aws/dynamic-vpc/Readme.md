* We are provisioning a VPC with dynamic subnets creation, it demostrate the use of 
- list
- count parameter
- count.index
- element()
- length()
- replace()  function and also 
- datasources.

* Each subnet will be created in different AZ dynamically for that we made use of datasource in vars.tf


* Here below are same end result:

![dynamic-subnets-in-same-az](same-azs.png)


![dynamic-subnets-in-different-az](same-azs.png)
