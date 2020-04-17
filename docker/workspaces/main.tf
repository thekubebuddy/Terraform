resource "docker_image" "container_image" {
  name         = lookup(var.image_name, var.env)
  keep_locally = "true"
}


resource "docker_container" "container_name" {
  name  = lookup(var.container_name, var.env)
  image = docker_image.container_image.name
  ports {
    internal = var.internal_port
    external = lookup(var.external_port, var.env)
  }
}
