
output "env_name" {
  value = var.env
}


output "image_name" {
  value = docker_image.container_image.name
}

output "container_name" {
  value = docker_container.container_name.name
}

output "container_port" {
  value = docker_container.container_name.ports[0].internal
}

output "container_ip" {
  value = docker_container.container_name.ip_address
}
