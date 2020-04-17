
output "environment" {
  value = var.env
}
output "image_name" {
  value = docker_image.image_id.name
}

output "container_name" {
  value = docker_container.container_id.name
}

output "container_ip" {
  value = docker_container.container_id.ip_address
}

