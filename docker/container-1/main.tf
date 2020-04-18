# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = "ghost:latest"
  keep_locally = true
}


# Start the Container
resource "docker_container" "container_id" {
  name  = "ghost_blog"
  image = docker_image.image_id.latest
  ports {
    internal = "2368"
    external = "8081"
  }
}



output "container_ip" {
  value = docker_container.container_id.ip_address
}
