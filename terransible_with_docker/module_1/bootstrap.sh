#!/bin/bash
# installing the open-ssh
apt-get update -y && apt install software-properties-common unzip git vim openssh-server -y
service ssh start
sed -i 's|#   PasswordAuthentication yes|PasswordAuthentication yes |g' /etc/ssh/ssh_config
sed -i 's|#   Port 22|Port 22|g' /etc/ssh/ssh_config
sed -i 's|#PermitRootLogin prohibit-password|PermitRootLogin yes|g' /etc/ssh/sshd_config
echo  -e "root123\nroot123" | passwd root
service ssh stop
service ssh start

# Configuring passwordless ssh witin container
#ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null
#cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
