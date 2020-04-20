variable "image_name" {
  description = "describe your variable"
  default     = "ghost:alpine"
}

variable "container_name" {
  description = "describe your variable"
  default     = "ghost_blog"
}

variable "external_port" {
  description = "describe your variable"
  default     = "8080"
}

variable "internal_port" {
  description = "describe your variable"
  default     = "2368"
}
