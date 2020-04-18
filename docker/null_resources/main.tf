resource "docker_image" "container_image" {
  name         = var.image_name
  keep_locally = "true"
}


resource "docker_container" "container_1" {
  name  = "${var.container_name}-${random_id.suffix.hex}"
  image = docker_image.container_image.latest
  ports {

    internal = var.internal_port
    external = var.external_port
  }
  command = var.command
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "docker cp ./bootstrap.sh ${docker_container.container_1.name}:/tmp/ && docker exec ${docker_container.container_1.name} bash -c 'ls /tmp/;chmod +x /tmp/bootstrap.sh;/tmp/bootstrap.sh' | tee container.log && docker cp ./index.html ${docker_container.container_1.name}:/var/www/html/"

  }

}

resource "random_id" "suffix" {
  byte_length = 2

}


# resource "null_resource" "file_provisioner_sample" {
#   provisioner "file" {
#     content     = "./bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"

#   }

# }
