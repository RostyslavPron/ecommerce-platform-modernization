resource "aws_lb" "main" {
  name               = "${var.project_name}-alb"
  load_balancer_type = "application"

  internal = false

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnets

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_target_group" "ecs" {
  name     = "${var.project_name}-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  target_type = "ip"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "E-Commerce Platform Modernization"
      status_code  = "200"
    }
  }
}