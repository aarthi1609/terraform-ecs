output "ecr_repo_arn" { 
  value = module.ecr.ecr_repo_arn
}

output "ecr_repo_url" { 
  value = module.ecr.ecr_repo_url
}

output "task_definition_arn" { 
  value = module.ecs.task_definition_arn
}

output "service_arn" { 
  value = module.ecs.service_arn
}

output "task_role_arn" { 
  value = module.iam.task_role_arn
}

output "iam_ec2_role_arn" { 
  value = module.iam.ec2_role_arn
}

output "vpc_id" { 
  value = module.network.vpc_id
}   

output "public_subnet_ids" { 
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {       
  value = module.network.private_subnet_ids
}

output "igw_id" { 
  value = module.network.igw_id
}

output "nat_id" { 
  value = module.network.nat_id
}

output "vpc_security_group_ids" { 
  value = module.network.vpc_security_group_ids
}

output "asg_name" { 
  value = module.asg.asg_name
}

output "asg_arn" { 
  value = module.asg.asg_arn
}

output "asg_launch_template_id" { 
  value = module.asg.asg_launch_template_id
}

output "asg_launch_template_name" { 
  value = module.asg.asg_launch_template_name
}

output "launch_template_latest_version" { 
  value = module.asg.launch_template_latest_version
}

output "ecs_instance_profile_arn" { 
  value = module.iam.ecs_instance_profile_arn
}

output "ec2_instance_profile_arn" { 
  value = module.iam.ec2_instance_profile_arn    
}

output "target_group_arn" { 
  value = module.alb.alb_target_group_arn
}

output "ec2_instance_profile_name" { 
  value = module.iam.ec2_instance_profile_name
}

output "capacity_provider_arn" { 
  value = module.ecs.capacity_provider_arn
}

output "alb_security_group_id" {    
  value = module.network.alb_security_group_id
}