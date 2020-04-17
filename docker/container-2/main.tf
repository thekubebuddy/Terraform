# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = var.image_name
  keep_locally = true
}


# Start the Container
resource "docker_container" "container_id" {
  name  = var.container_name
  image = docker_image.image_id.latest
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

output "container_ip" {
  value = docker_container.container_id.ip_address
}
