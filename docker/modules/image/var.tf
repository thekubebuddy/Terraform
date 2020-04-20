variable "list_of_images" {
  # default = "ubuntu@sha256:acad929ffeda349d0e8c311baf841cc5251d228db7fae4b3f43e54bddbb743de"
  default = ["ghost:alpine", "ghost:latest"]

}

variable "count" {
  description = "describe your variable"
  default     = 2
}
