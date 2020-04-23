# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = "ubuntu:18.04"
  keep_locally = true
}


# Start the Container
resource "docker_container" "ubuntu_pod" {
  name    = "ubuntu"
  image   = docker_image.image_id.latest
  command = ["/bin/sleep", "infinity"]
  provisioner "local-exec" {
    command = <<EOD
cat <<EOF>>docker_host
[ubuntu]
${docker_container.ubuntu_pod.ip_address}
EOD
  }
  # Binding the docker sock with the container
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "docker cp ./bootstrap.sh ${docker_container.ubuntu_pod.name}:/tmp/ && docker exec ${docker_container.ubuntu_pod.name} bash -c 'ls /tmp/;chmod +x /tmp/bootstrap.sh;/tmp/bootstrap.sh'"
  }
}



output "container_ip" {
  value = docker_container.ubuntu_pod.ip_address
}
