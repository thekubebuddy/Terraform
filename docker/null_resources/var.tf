variable "image_name" {
  default = "ubuntu@sha256:e9ccb229a23d2d51da337c78c4ba1fd844f476e4639cd0c91099d1b62b8f8a45"
}

variable "container_name" {
  default = "ubuntu_apache2_wokload"
}
variable "command" {
  default = ["/bin/sleep", "infinity"]
}


variable "internal_port" {
  default = "80"
}

variable "external_port" {
  default = "8080"
}
