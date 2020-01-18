provider "aws" {
  region = "${var.region}"
  # Using a shared credential file for auth
  # shared_credentials_file = "~/.aws/credentials"
  # profile                 = "default"
}

resource "aws_vpc" "my-custom-vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "default"
  tags = {
    Name  = "my-custom-vpc"
    owner = "cloud_user"
  }
}

resource "aws_subnet" "subnet1" {

  vpc_id = "${aws_vpc.my-custom-vpc.id}"
  # vpc_id     = "aws_vpc.my-custom-vpc.id"
  cidr_block = "${var.subnet_cidr_block}"
  tags = {
    Name     = "subnet-1"
    vpc-name = "my-custom-vpc"
    type     = "public-subnet"
  }
}

