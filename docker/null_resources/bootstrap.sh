#!/bin/bash
apt-get update && apt install apache2 net-tools -y
service apache2 start
service apache2 status
netstat -tupln

