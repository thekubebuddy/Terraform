variable "image_name" {
  default = " ubuntu:rolling"
}

variable "container_name" {
  default = "ubuntu_apache2_wokload"
}
variable "command" {
  default = ["/bin/sleep", "infinity"]
}
