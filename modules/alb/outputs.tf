output "alb_name" { 
    value = aws_lb.alb.name
}

output "alb_arn" { 
    value = aws_lb.alb.arn
}   

output "alb_dns_name" { 
    value = aws_lb.alb.dns_name
}

output "alb_target_group_arn" { 
    value = aws_lb_target_group.service_target_group.arn
}

output "alb_target_group_name" { 
    value = aws_lb_target_group.service_target_group.name
}       
  