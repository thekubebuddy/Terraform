variable "region_name" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "192.168.0.0/16"
}



# data will return list so it will be handle by a element() function
data "aws_availability_zones" "azs" {}


# the data source will return the subnet ids in our "custom-vpc"
data "aws_subnet_ids" "subs" {
  vpc_id = aws_vpc.custom-vpc.id
}
