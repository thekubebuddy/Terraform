resource "docker_container" "container_1" {
  name  = var.container_name
  image = var.image
  ports {
    internal = var.int_port
    external = var.ext_port
  }

}
