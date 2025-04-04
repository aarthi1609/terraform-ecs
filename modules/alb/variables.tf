variable "security_groups" {
    type = list(string)
}

variable "subnets" {    
    type = list(string) 
}

variable "vpc_id" {    
    type = string
}

variable "healthcheck_endpoint" {    
    type = string
}       

variable "domain_name" {    
    type = string   
}

variable "project_name" {    
    type = string
}   

variable "environment" {    
    type = string   
}

variable "certificate_arn" {
    type = string   
}
