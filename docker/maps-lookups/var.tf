
# Excepting a variable from the user
variable "env" {
  description = "Please select the env: dev or prod"
}


variable "image_name" {

  type = map

  default = {
    prod = "ghost:latest"
    dev  = "ghost:alpine"
  }
}

variable "container_name" {

  description = "describe your variable"

  default = {
    prod = "blog_prod"
    dev  = "blog_dev"
  }

}


variable "int_port" {
  # default = "80"
  default = "2368"

}

variable "ext_port" {
  type = map
  default = {
    prod = "8080"
    dev  = "8081"
  }
}
