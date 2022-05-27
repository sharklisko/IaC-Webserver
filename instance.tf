resource "aws_instance" "arasit" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-private-1.id
  vpc_security_group_ids = [aws_security_group.instance-securitygroup.id]
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get -y install nginx
echo "DevOps Task-1!!!" > /var/www/html/index.nginx-debian.html
service nginx start
EOF
  provisioner "local-exec" {
    command = "echo ${aws_instance.arasit.private_ip} >> private_ips.txt"
  }
}




