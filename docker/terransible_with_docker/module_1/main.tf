# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = "ubuntu:18.04"
  keep_locally = true
}


# Start the Container
resource "docker_container" "ubuntu_pod_1" {
  name    = "ubuntu"
  image   = docker_image.image_id.latest
  command = ["/bin/sleep", "infinity"]
  provisioner "local-exec" {
    command = <<EOD
cat <<EOF>>docker_hosts
[ubuntu]
${docker_container.ubuntu_pod_1.ip_address}
EOD
  }
}


