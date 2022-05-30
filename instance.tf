resource "aws_instance" "arasit" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-private-1.id
  vpc_security_group_ids = [aws_security_group.arasit.id]
  user_data = "${file("install_nginx.sh")}"
  provisioner "local-exec" {
    command = "echo ${aws_instance.arasit.private_ip} >> private_ips.txt"
  }
}




