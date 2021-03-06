resource "aws_elb" "public" {
  name            = "public"
  subnets         = [aws_subnet.main-public-1.id]
  security_groups = [aws_security_group.elb.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "public"
  }
}

resource "aws_elb_attachment" "baz" {
  elb      = aws_elb.public.id
  instance = aws_instance.arasit.id
}