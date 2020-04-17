resource "docker_image" "container_image" {
  name         = var.image_name
  keep_locally = "true"
}


resource "docker_container" "container_1" {
  name  = var.container_name
  image = docker_image.container_image.name
  # ports {

  #   internal = var.internal_port
  #   external = lookup(var.external_port, var.env)
  # }
  command = var.command
}

resource "null_resource" "null_id" {
  provisioner "local-exec" {
    # command = "echo ${docker_container.container_1.name}:${docker_container.container_1.ip_address} >> docker_container.info"
    command = "docker cp ./bootstrap.sh ${docker_container.container_1.name}:/tmp/ && docker exec ${docker_container.container_1.name} bash -c 'ls /tmp/;chmod +x /tmp/bootstrap.sh;/tmp/bootstrap.sh'"

  }

}


# resource "null_resource" "file_provisioner_sample" {
#   provisioner "file" {
#     content     = "./bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"

#   }

# }
