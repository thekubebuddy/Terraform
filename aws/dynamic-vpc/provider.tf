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
  count      = length(data.azs.available)
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = element(var.cidr_vpc_cidr, count.index)

  tags = {
    Name = "subnet-${count.index + 1}"
  }
}

