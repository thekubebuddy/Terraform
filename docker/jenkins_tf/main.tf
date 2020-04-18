resource "docker_image" "jenkins_image" {
  name         = var.image_name
  keep_locally = "true"
}



resource "docker_container" "jenkins_container" {
  name  = var.container_name
  image = docker_image.jenkins_image.latest

  ports {
    internal = "8080"
    external = "8080"
  }

  volumes {
    volume_name    = docker_volume.jenkins_volume.name
    container_path = "/var/jenkins_home"
  }

  # for connecting the underlying host docker socket 
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}


# It will create a volume in /var/lib/docker/volumes/
resource "docker_volume" "jenkins_volume" {
  name = "jenkins_data"
  lifecycle {
    prevent_destroy = true
  }
}





