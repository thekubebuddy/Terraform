
variable "image_name" {
  description = "describe your variable"
  default     = "ghost:latest"
  # default = "nginx"

}

variable "container_name" {
  description = "describe your variable"
  default     = "ghost_blog"
  # default = "nginx_container1"

}


variable "int_port" {
  # default = "80"
  default = "2368"

}

variable "ext_port" {
  default = "8080"
}
