# Elastic Container Service (ECS) Module

This module sets up a complete ECS environment with cluster, task definitions, services, and capacity providers.

## Features
- Creates ECS cluster with EC2 launch type
- Sets up task definitions with CloudWatch logging
- Configures ECS service with load balancer integration
- Manages capacity providers with Auto Scaling Group
- Handles container deployment and scaling
- Includes Docker image build and push functionality

## Required Inputs
- `task_definition_family_name` - Family name for the task definition
- `container_name` - Name of the container
- `ecr_repo_url` - URL of the ECR repository
- `target_group_arn` - ARN of the ALB target group
- `execution_role_arn` - ARN of the ECS task execution role
- `task_role_arn` - ARN of the ECS task role
- `network_mode` - Network mode for task definition
- `asg_arn` - ARN of the Auto Scaling Group
- `container_port` - Container port number
- `host_port` - Host port number
- `cpu` - CPU units for the task
- `memory` - Memory limit for the task
- `tag` - Docker image tag
- `operating_system_family` - OS family for the task
- `cpu_architecture` - CPU architecture for the task
- `role` - Role for placement constraints
- `service_name` - Name of the ECS service
- `ecs_cluster_name` - Name of the ECS cluster
- `capacity_provider_name` - Name of the capacity provider
- `retention_in_days` - CloudWatch logs retention period
- `aws_region` - AWS region

## Created Resources
1. CloudWatch Log Group:
   - Name: `/ecs/${task_definition_family_name}`
   - Retention: Configurable in days

2. ECS Task Definition:
   - Family: Custom name
   - Compatibility: EC2
   - Network Mode: Configurable
   - CPU/Memory: Configurable
   - Container Definition: 
     - Image from ECR
     - Port mappings
     - CloudWatch logging

3. ECS Cluster:
   - Name: Custom name
   - Capacity Provider: ASG-based

4. ECS Service:
   - Name: Custom name
   - Task Definition: Latest version
   - Desired Count: Configurable
   - Load Balancer Integration
   - Placement Strategy: AZ spread

## Outputs
   - `task_definition_arn` - ARN of the ECS task definition
   - `service_arn` - ARN of the ECS service
   - `capacity_provider_arn` - ARN of the capacity provider
   
## Usage Example

module "ecs" {
  source = "./modules/ecs"
  
  task_definition_family_name = "my-app"
  container_name             = "my-container"
  ecr_repo_url              = "123456789012.dkr.ecr.region.amazonaws.com/my-repo"
  target_group_arn          = "arn:aws:elasticloadbalancing:..."
  execution_role_arn        = "arn:aws:iam::..."
  task_role_arn            = "arn:aws:iam::..."
  network_mode             = "bridge"
  asg_arn                  = "arn:aws:autoscaling:..."
  
  container_port           = 80
  host_port               = 80
  cpu                     = "256"
  memory                  = "512"
  tag                     = "latest"
  
  operating_system_family = "LINUX"
  cpu_architecture        = "X86_64"
  role                    = "ecs-instance"
  
  service_name            = "my-service"
  ecs_cluster_name        = "my-cluster"
  capacity_provider_name  = "my-capacity-provider"
  
  retention_in_days       = 30
  aws_region             = "ap-south-1"
}