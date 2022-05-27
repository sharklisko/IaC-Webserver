resource "aws_security_group" "instance-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "instance"
  description = "security group for instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 58
    to_port     = 58
    protocol    = "tcp"
    cidr_blocks = ["192.58.1.0/24"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb-securitygroup.id]
  }

  tags = {
    Name = "instance"
  }
}

resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = aws_vpc.main.id
  name        = "elb"
  description = "security group for load balancer"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb"
  }
}
