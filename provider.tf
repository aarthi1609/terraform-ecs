terraform {
  required_providers {
    aws = { source = "hashicorp/aws", 
    version = "5.17.0" }

    # backend "s3" {
    #   region       = "ap-south-1"
    #   encrypt      = true
    #   use_lockfile = true
    #   bucket       = "mako-tf-state-bucket"
    #   key          = "dev/terraform.tfstate"
    # }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}