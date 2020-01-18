provider "aws" {
  region = var.region_name
}

resource "aws_vpc" "main-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name  = "main"
    owner = "me"
  }
}

resource "aws_subnet" "subnets" {
  # count      = length(var.azs)
  count  = length(data.aws_availability_zones.azs.names)
  vpc_id = aws_vpc.main-vpc.id

  # cidr_block = element(var.cidr_vpc_cidr, count.index)

  # dynamically constructing the subnet cidr from the vpc_cidr variable
  # cidr_block = replace("192.168.0.0/16", "/0.0/16/", "3.0/24")
  cidr_block = replace("${var.vpc_cidr}", "/0.0/16/", "${count.index + 1}.0/24")

  # dynamicakky adding the subnet to each of the AZ's instead of same AZ's
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  tags = {
    Name = "subnet-${count.index + 1}"
  }
}

