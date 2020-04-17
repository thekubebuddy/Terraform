variable "image_name" {
  default = "ubuntu"
}

variable "container_name" {
  default = "ubuntu_workload"
}
variable "command" {
  default = ["/bin/sleep", "infinity"]
}
