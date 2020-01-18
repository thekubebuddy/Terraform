variable "region_name" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string

  # description = "describe your variable"
  default = "192.168.0.0/16"
}


# variable "cidr_vpc_cidr" {
#   type = list(string)
#   # description = "describe your variable"
#   default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
# }


# if region chnges than the AZ list also chnges accordinly hence it should be dynamic, for that we used the datasource
# variable "azs" {
#   type = list(string)

#   # description = "describe your variable"
#   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
# }


data "aws_availability_zones" "azs" {}
