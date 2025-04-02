output "asg_name" { 
  value = aws_autoscaling_group.ecs_autoscaling_group.name
}

output "asg_arn" { 
  value = aws_autoscaling_group.ecs_autoscaling_group.arn
}

output "asg_launch_template_id" { 
  value = aws_launch_template.ecs_launch_template.id
}

output "asg_launch_template_name" { 
  value = aws_launch_template.ecs_launch_template.name
}

output "launch_template_latest_version" { 
  value = aws_launch_template.ecs_launch_template.latest_version
}
