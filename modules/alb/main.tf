resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name               = "${var.project_name}-alb-${var.environment}"
  security_groups    = var.security_groups
  subnets            = var.subnets
  internal    = false
}

resource "aws_lb_target_group" "service_target_group" {
  name                 = "${var.project_name}-tg-${var.environment}"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = 120

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 60
    path                = var.healthcheck_endpoint
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 30
  }
  depends_on = [aws_lb.alb]
}

# HTTP Listener (Redirect to HTTPS)
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}



