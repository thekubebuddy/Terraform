# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = lookup(var.image_name, var.env)
  keep_locally = true
}


# Start the Container
resource "docker_container" "container_id" {
  name  = lookup(var.container_name, var.env)
  image = docker_image.image_id.name
  ports {
    internal = var.int_port
    external = lookup(var.ext_port, var.env)
  }
}

