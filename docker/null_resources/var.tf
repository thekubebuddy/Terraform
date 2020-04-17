variable "image_name" {
  default = "ubuntu@sha256:acad929ffeda349d0e8c311baf841cc5251d228db7fae4b3f43e54bddbb743de"
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
