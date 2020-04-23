# Download the latest Ghost image
resource "docker_image" "image_id" {
  name         = "ubuntu:18.04"
  keep_locally = true
}


# Start the Container
# resource "docker_container" "ubuntu_pod_1" {
#   name    = "ubuntu_1"
#   image   = docker_image.image_id.latest
#   command = ["/bin/sleep", "infinity"]

#   provisioner "local-exec" {
#     command = <<EOD
# docker cp ./bootstrap.sh ${docker_container.ubuntu_pod_1.name}:/tmp/ 

# docker exec ${docker_container.ubuntu_pod_1.name} bash -c 'ls /tmp/;chmod +x /tmp/bootstrap.sh;/tmp/bootstrap.sh' | tee container.log

# rm ~/.ssh/known_hosts

# sshpass -p 'root123' ssh-copy-id root@${docker_container.ubuntu_pod_1.ip_address} -o StrictHostKeyChecking=no

# cat <<EOF>docker_hosts
# [${docker_container.ubuntu_pod_1.name}]
# ${docker_container.ubuntu_pod_1.ip_address}
# EOF
# ansible ${docker_container.ubuntu_pod_1.name} -i docker_hosts -m ping
# EOD
#   }

# }





resource "docker_container" "ubuntu_pod" {
  count   = 2
  name    = "ubuntu_pod_${count.index}"
  image   = docker_image.image_id.latest
  command = ["/bin/sleep", "infinity"]

  #   provisioner "local-exec" {
  #     command = <<EOD
  # echo ${docker_container.ubuntu_pod[count.index + 1].name}
  # EOF
  # EOD
  #   }
}



resource "null_resource" "cluster" {

  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    # command = "bootstrap-cluster.sh ${join(" ", docker_container.ubuntu_pod.*.name)}"
    command = <<EOD
echo ${join(" ", docker_container.ubuntu_pod.*.name)}
for x in ${join(" ", docker_container.ubuntu_pod.*.name)}
do
echo $x
done
EOF
EOD
  }
}
