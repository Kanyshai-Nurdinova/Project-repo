resource "aws_launch_template" "foobar" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = [data.aws_availability_zones.available.names[0],
                        data.aws_availability_zones.available.names[1],
                       data.aws_availability_zones.available.names[2] ]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = "ami-0604f27d956d83a4d"
    version = "$Latest"
    
  }
}


resource "aws_elb" "bar" {
  name     = "foobar-terraform-elbs"
  subnets  = [ var.public_subnet1,
    var.public_subnet2,
    var.public_subnet3]
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
    target              = "TCP:80"
    interval            = 30
  }
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}



resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  elb                    = aws_elb.bar.id
}