# Terraform ECS Infrastructure

This repository contains Terraform modules for deploying a production-ready ECS infrastructure on AWS.

## Architecture Overview

The infrastructure consists of the following components:

1. **Network Layer** (`/modules/network`)
   - VPC with public and private subnets
   - NAT Gateway for private subnet access
   - Security groups for ALB and ECS

2. **Container Registry** (`/modules/ecr`)
   - ECR repository for storing container images
   - Lifecycle policies for image management

3. **Load Balancer** (`/modules/alb`)
   - Application Load Balancer
   - HTTPS listener with SSL/TLS support
   - Target groups for container routing

4. **Auto Scaling** (`/modules/asg`)
   - Launch template for EC2 instances
   - Auto Scaling Group for ECS container instances

5. **Container Service** (`/modules/ecs`)
   - ECS cluster
   - Task definitions
   - Service configuration
   - Capacity provider integration

6. **IAM Roles** (`/modules/iam`)
   - ECS task execution roles
   - EC2 instance roles
   - Required policies and profiles

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform v1.0.0 or newer
- Docker installed (for container builds)
- Valid SSL certificate in AWS Certificate Manager (for HTTPS)

## Quick Start

1. Clone the repository:

git clone 
cd terraform-ecs


2. Initialize Terraform:

    terraform init


3. Configure your variables in `terraform.tfvars`:

project_name = "your-project"
environment  = "prod"
region       = "ap-south-1"

4. Review and apply the configuration:

    terraform plan
    terraform apply

5. To destroy thr resources:

    terraform destroy


## Module Dependencies


network --> alb
   |
   |--> iam --> asg --> ecs
   |
   |--> ecr ----^


## Security Features

- Private subnets for ECS tasks
- HTTPS only on ALB
- IAM roles with least privilege
- Security groups with minimal access
- Immutable ECR tags
- Auto container scanning

## Monitoring & Logging

- CloudWatch Logs for containers
- Container health checks
- ALB access logs
- Auto Scaling metrics

## Cost Optimization

- Auto Scaling based on demand
- NAT Gateway sharing
- ECR image lifecycle policies
- Spot instance support (optional)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.


