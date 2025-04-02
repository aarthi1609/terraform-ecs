output "task_definition_arn" { 
  value = aws_ecs_task_definition.ecs_task_definition.arn
}   

output "service_arn" {
  value = aws_ecs_service.ecs_service.id
}

output "capacity_provider_arn" { 
  value = aws_ecs_capacity_provider.capacity_provider.arn
}