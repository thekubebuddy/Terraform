provider "aws" {
  region = var.region_name
}

resource "aws_vpc" "custom-vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name  = "custom-vpc"
    owner = "me"
  }


}


resource "aws_subnet" "public-subnet" {
  count  = 3
  vpc_id = aws_vpc.custom-vpc.id

  cidr_block = replace("${var.vpc_cidr_block}", "/0.0/16/", "${count.index + 1}.0/24")

  # availability_zone = element("${data.aws_availability_zone.azs.names}", "${count.index + 1}")
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet-${count.index + 1}"
    type = "public"
    az   = element("${data.aws_availability_zones.azs.names}", "${count.index + 1}")
  }


}


# igw creation and attaching to custom-vpc
resource "aws_internet_gateway" "custom-igw" {
  vpc_id = aws_vpc.custom-vpc.id
  tags = {
    Name = "custom-igw"
  }
}


# Rote table creation for the public subnet
resource "aws_route_table" "custom-public-rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom-igw.id
  }

  # route {
  #   ipv6_cidr_block        = "::/0"
  #   egress_only_gateway_id = "${aws_egress_only_internet_gateway.foo.id}"
  # }

  tags = {
    Name = "custom-public-rt"
  }
}




# resource "aws_route_table_association" "public-rt-association" {
#   count          = 3
#   subnet_id      = element("${data.aws_subnet_ids.subs.id}", "${count.index + 1}")
#   route_table_id = aws_route_table.custom-public-rt.id
# }
