#!/bin/bash
apt-get update
apt-get -y install nginx
echo "DevOps Task-1!!!" > /var/www/html/index.nginx-debian.html
service nginx start

