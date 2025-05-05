# Application Load Balancer (ALB) Module

This module creates an Application Load Balancer with HTTPS support for the ECS service.

## Features
- Creates an Application Load Balancer
- Sets up HTTP to HTTPS redirection
- Configures target group with health checks
- Supports custom domain with SSL/TLS certificate

## Required Inputs
- `security_groups` - List of security group IDs for the ALB
- `subnets` - List of subnet IDs where the ALB will be deployed
- `vpc_id` - VPC ID where the ALB will be created
- `healthcheck_endpoint` - The endpoint for health checks
- `domain_name` - Domain name for the ALB
- `project_name` - Name of the project
- `environment` - Environment name (e.g., dev, prod)
- `certificate_arn` - ARN of the SSL/TLS certificate

## Outputs
- `alb_name` - Name of the Application Load Balancer
- `alb_arn` - ARN of the Application Load Balancer
- `alb_dns_name` - DNS name of the Application Load Balancer
- `alb_target_group_arn` - ARN of the target group
- `alb_target_group_name` - Name of the target group

## Created Resources
1. Application Load Balancer:
   - Name: `${project_name}-alb-${environment}`
   - Type: Application
   - Internal: false
   - Security Groups: Configurable

2. Target Group:
   - Name: `${project_name}-tg-${environment}`
   - Protocol: HTTP
   - Port: 80
   - Health Check: Configurable
   - Deregistration Delay: 120s

3. Listeners:
   - HTTP (80): Redirects to HTTPS
   - HTTPS (443): 
   - SSL/TLS certificate
   - Host-based routing

## Usage Example

module "alb" {
  source              = "./modules/alb"
  project_name        = "my-project"
  environment         = "prod"
  security_groups     = ["sg-xxxxxx"]
  subnets            = ["subnet-xxxxx", "subnet-yyyy"]
  vpc_id             = "vpc-xxxxx"
  healthcheck_endpoint = "/health"
  domain_name        = "example.com"
  certificate_arn    = "arn:aws:acm:region:account:certificate/xxx"
}