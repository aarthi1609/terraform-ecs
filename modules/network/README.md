# Network Module

This module sets up a complete VPC networking infrastructure for the ECS cluster.

## Features
- Creates VPC with DNS support
- Sets up public and private subnets across multiple AZs
- Configures Internet Gateway for public access
- Implements NAT Gateway for private subnet outbound traffic
- Manages route tables and associations
- Creates security groups for ALB and ECS

## Required Inputs
- `vpc_cidr_block` - CIDR block for the VPC
- `project_name` - Name of the project
- `environment` - Environment name (e.g., dev, prod)
- `availability_zones` - List of AZs to use
- `public_subnets_cidr` - List of CIDR blocks for public subnets
- `private_subnets_cidr` - List of CIDR blocks for private subnets
- `vpc_id` - VPC ID for security groups
- `ecs_sg_name` - Name for ECS security group
- `alb_sg_name` - Name for ALB security group
- `ecs_sg_description` - Description for ECS security group
- `alb_sg_description` - Description for ALB security group

## Created Resources
1. VPC:
   - CIDR Block: Configurable
   - DNS Support: Enabled
   - DNS Hostnames: Enabled

2. Subnets:
   - Public Subnets: Multiple AZs
   - Private Subnets: Multiple AZs
   - Auto-assign Public IPs: Public only

3. Gateways:
   - Internet Gateway: For public subnets
   - NAT Gateway: For private subnets
   - Elastic IP: For NAT Gateway

4. Route Tables:
   - Public: Routes through IGW
   - Private: Routes through NAT

5. Security Groups:
   - ALB: Ports 80/443 inbound
   - ECS: Dynamic ports from ALB

## Outputs
- `vpc_id` - ID of the created VPC
- `public_subnet_ids` - List of public subnet IDs
- `private_subnet_ids` - List of private subnet IDs
- `public_subnet_cidr` - List of public subnet CIDR blocks
- `private_subnet_cidr` - List of private subnet CIDR blocks
- `igw_id` - ID of the Internet Gateway
- `nat_id` - ID of the NAT Gateway
- `vpc_security_group_ids` - List of ECS security group IDs
- `alb_security_group_id` - ID of the ALB security group

## Usage Example

module "network" {
  source = "./modules/network"
  
  vpc_cidr_block       = "10.0.0.0/16"
  project_name         = "my-project"
  environment          = "prod"
  
  availability_zones    = ["ap-south-1a", "ap-south-1b"]
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
  
  vpc_id              = aws_vpc.main.id
  ecs_sg_name         = "ecs-sg"
  alb_sg_name         = "alb-sg"
  ecs_sg_description  = "Security group for ECS tasks"
  alb_sg_description  = "Security group for ALB"
}