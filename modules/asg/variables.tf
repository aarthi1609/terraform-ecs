variable "launch_template_name" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "vpc_security_group_ids" {
    type = list(string)
}

variable "private_subnet_ids" {
    type = list(string)
}

variable "launch_template_description" {
    type = string
}

variable "autoscaling_max_size" {
    type = number
}

variable "autoscaling_min_size" {
    type = number
}

variable "autoscaling_desired_capacity" {
    type = number
}

variable "ami_id" {
    type = string
}

variable "project_name" {   
    type = string
}

variable "environment" {   
    type = string
}

variable "ecs_cluster_name" {   
    type = string   
}

variable "ec2_instance_profile_name" {
    type = string
}

variable "role" {
    type = string
}