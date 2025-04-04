terraform {
  required_providers {
    aws = { source = "hashicorp/aws", 
    version = "5.17.0" }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}