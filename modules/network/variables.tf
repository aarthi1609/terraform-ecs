variable "vpc_cidr_block" {
    type = string
}

variable "project_name" {
    type = string
}

variable "environment" {
    type = string
}

variable "availability_zones" {
    type = list(string)
}

variable "public_subnets_cidr" {
    type = list(string)
}   

variable "private_subnets_cidr" {
    type = list(string)
}   

variable "vpc_id" {   
    type = string
}

variable "ecs_sg_name" {   
    type = string
}

variable "alb_sg_name" {   
    type = string
}

variable "ecs_sg_description" {   
    type = string
}

variable "alb_sg_description" {   
    type = string
}