#!/bin/bash
# installing the 
apt-get update -y && apt install software-properties-common unzip git vim openssh-server sshpass -y
apt-add-repository ppa:ansible/ansible -y
apt update
apt install ansible -y
# installing docker and terraform
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
apt-get install -y docker-ce docker-ce-cli containerd.io
curl -O https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip && unzip terraform_0.12.24_linux_amd64.zip -d /usr/local/bin/
terraform -install-autocomplete
service ssh start
# Configuring passwordless ssh witin container
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
