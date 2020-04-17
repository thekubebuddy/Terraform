variable "project" {
  default = ""
}

variable "region" {
  default = "us-west2"
}

variable "zone" {
  default = "us-west2-b"
}

variable "vpc_network" {
  default = "terraform-network"
}

variable "subnetwork" {
  default = "terraform-public-sb1"
}

variable "subnet_cidr" {
  default = "10.10.0.0/16"
}

variable "static_internal_ip" {
  default = "10.10.0.4"
}


variable "machine_type" {
  # default = "f1-micro"
  default = "custom-4-8192"
}


variable "image_name" {
  default = ""

}
