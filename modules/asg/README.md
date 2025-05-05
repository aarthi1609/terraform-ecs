# Auto Scaling Group (ASG) Module

This module creates and manages an Auto Scaling Group for ECS container instances, including the launch template configuration.

## Features
- Creates a Launch Template with ECS-optimized configuration
- Sets up Auto Scaling Group with customizable capacity
- Configures instance refresh strategy for rolling updates
- Supports custom security groups and networking
- Includes user data script for ECS cluster registration

## Required Inputs
- `launch_template_name` - Name for the launch template
- `launch_template_description` - Description for the launch template
- `instance_type` - EC2 instance type to use
- `vpc_security_group_ids` - List of security group IDs for EC2 instances
- `private_subnet_ids` - List of private subnet IDs for ASG deployment
- `autoscaling_max_size` - Maximum number of instances in ASG
- `autoscaling_min_size` - Minimum number of instances in ASG
- `autoscaling_desired_capacity` - Desired number of instances in ASG
- `ami_id` - ID of the ECS-optimized AMI to use
- `project_name` - Name of the project
- `environment` - Environment name (e.g., dev, prod)
- `ecs_cluster_name` - Name of the ECS cluster to join
- `ec2_instance_profile_name` - Name of the IAM instance profile
- `role` - Role name for the EC2 instances

## Outputs
- `asg_name` - Name of the Auto Scaling Group
- `asg_arn` - ARN of the Auto Scaling Group
- `asg_launch_template_id` - ID of the launch template
- `asg_launch_template_name` - Name of the launch template
- `launch_template_latest_version` - Latest version of the launch template

## Created Resources
1. Launch Template:
   - Name: Configurable
   - AMI: ECS-optimized
   - Instance Type: Configurable
   - Network: Private subnets
   - User Data: ECS registration
   - IAM: Instance profile

2. Auto Scaling Group:
   - Name: `${project_name}-autoscaling-${environment}`
   - Capacity: Min/Max/Desired
   - Health Check: EC2
   - Strategy: Rolling updates
   - Placement: Private subnets

## Usage Example

module "asg" {
  source = "./modules/asg"
  
  project_name        = "my-project"
  environment         = "prod"
  launch_template_name = "my-project-lt"
  launch_template_description = "Launch template for ECS instances"
  instance_type      = "t3.medium"
  ami_id             = "ami-xxxxxx"
  vpc_security_group_ids = ["sg-xxxxxx"]
  private_subnet_ids    = ["subnet-xxxxx", "subnet-yyyy"]
  autoscaling_max_size = 4
  autoscaling_min_size = 1
  autoscaling_desired_capacity = 2
  ecs_cluster_name   = "my-ecs-cluster"
  ec2_instance_profile_name = "ecs-instance-profile"
  role = "ecs-instance-role"
}