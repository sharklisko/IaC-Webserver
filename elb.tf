# Do not repeat resource type in resource name.
# We use this or default as a resource name if there is no specsification.
# i.e. if you have 2 different resource "aws_elb" in your terraform file, you can specifiy the name, otherwise it will be good default or this
# https://www.terraform-best-practices.com/naming#resource-and-data-source-arguments
resource "aws_elb" "my-elb" {
  name            = "my-elb"
  subnets         = [aws_subnet.main-public-1.id]
  security_groups = [aws_security_group.elb-securitygroup.id]
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
    Name = "my-elb"
  }
}

resource "aws_elb_attachment" "baz" {
  elb      = aws_elb.my-elb.id
  instance = aws_instance.arasit.id
}
