# Elastic Container Registry (ECR) Module

This module creates and manages an Amazon Elastic Container Registry (ECR) repository with security and lifecycle configurations.

## Features
- Creates a secure ECR repository with AES256 encryption
- Configures immutable image tags for enhanced security
- Enables automatic image scanning on push
- Implements lifecycle policy to manage image retention
- Supports force delete for easy cleanup

## Required Inputs
- `repo_name` - Name of the ECR repository
- `image_count` - Number of images to keep in the repository (lifecycle policy)

## Created Resources
1. ECR Repository:
   - Name: Specified by `repo_name`
   - Image Tag Mutability: IMMUTABLE
   - Encryption: AES256
   - Scan on Push: Enabled
   - Force Delete: Enabled

2. Lifecycle Policy:
   - Rule Priority: 1
   - Description: Keep only last N images
   - Count Type: imageCountMoreThan
   - Tag Status: any
   - Action: expire

## Outputs
   - `ecr_repo_arn` - ARN of the ECR repository
   - `ecr_repo_url` - URL of the ECR repository
   
## Usage Example

module "ecr" {
  source = "./modules/ecr"
  
  repo_name   = "my-application"
  image_count = 5  # Keep last 5 images
}