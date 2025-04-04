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

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

   default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }

}

resource "aws_lb_listener_rule" "rule" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 1
  tags = {
    Name = "${var.project_name}-rule-${var.environment}"}

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service_target_group.arn
  }

  condition {
    host_header {
      values = [var.domain_name]
    }
  }
}



