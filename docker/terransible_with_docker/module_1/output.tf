output "container_name" {
  value = docker_container.ubuntu_pod_1.name
}

output "container_ip" {
  value = docker_container.ubuntu_pod_1.ip_address
}
