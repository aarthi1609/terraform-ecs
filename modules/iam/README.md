# IAM Module

This module manages AWS IAM roles and policies required for ECS cluster operation.

## Features
- Creates ECS task execution role
- Creates EC2 instance role
- Sets up instance profiles for both EC2 and ECS
- Attaches necessary AWS managed policies
- Configures secure role assumption policies

## Created Resources
1. ECS Task Role:
   - Name: `ecstaskrole`
   - Purpose: Used by ECS tasks to access AWS services
   - Attached Policy: AmazonECSTaskExecutionRolePolicy

2. EC2 Role:
   - Name: `ec2role`
   - Purpose: Used by EC2 instances in the ECS cluster
   - Attached Policies:
     - AmazonEC2ContainerServiceforEC2Role
     - AmazonEC2ContainerRegistryFullAccess
     - AmazonSSMManagedInstanceCore
     - CloudWatchAgentServerPolicy

3. Instance Profiles:
   - EC2 Instance Profile: `ec2-instance-profile`
   - ECS Instance Profile: `ecs-instance-profile`

## Outputs
- `task_role_arn` - ARN of the ECS task role
- `ec2_role_arn` - ARN of the EC2 role
- `ec2_instance_profile_arn` - ARN of the EC2 instance profile
- `ecs_instance_profile_arn` - ARN of the ECS instance profile
- `ec2_instance_profile_name` - Name of the EC2 instance profile

## Usage Example

module "iam" {
  source = "./modules/iam"
}