# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = "ubuntu:latest"
  keep_locally = true
}


# Start the Container
resource "docker_container" "ubuntu_pod" {
  name    = "ubuntu"
  image   = docker_image.image_id.latest
  command = ["/bin/sleep infinity"]
  provisioner "local-exec" {
    command = <<EOD
cat <<EOF>>docker_host
[ubuntu]
${docker_container.ubuntu_pod.ip_address}
EOD
  }

}



output "container_ip" {
  value = docker_container.ubuntu_pod.ip_address
}
