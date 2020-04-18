resource "docker_image" "image_1" {
  name         = var.image_name
  keep_locally = true
}
