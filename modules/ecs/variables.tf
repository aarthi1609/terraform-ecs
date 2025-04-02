variable "task_definition_family_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "ecr_repo_url" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "execution_role_arn" { 
  type = string
}

variable "network_mode" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "asg_arn" {
  type = string
}

variable "container_port" {
  type = number
}

variable "host_port" {
  type = number
}

variable "cpu" {
  type = string
}

variable "memory" {
  type = string
}

variable "tag" {
  type = number
}

variable "operating_system_family" {
  type = string
}

variable "cpu_architecture" {
  type = string
}

variable "role" {
  type = string
}

variable "service_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "capacity_provider_name" {
  type = string
} 

variable "retention_in_days" {
  type = number
}

variable "aws_region" {
  type = string     
}

 