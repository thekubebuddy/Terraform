variable "env" {
  description = "env prod or dev:"
}



variable "image_name" {
  type = map
  default = {
    prod = "ghost:latest"
    dev  = "ghost:alpine"

  }
}

variable "container_name" {
  type = map
  default = {
    prod = "blog_prod"
    dev  = "blog_dev"
  }
}

variable "external_port" {
  type = map
  default = {
    prod = "8081"
    dev  = "8080"
  }
}


variable "internal_port" {
  default = "2368"
}
