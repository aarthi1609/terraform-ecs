output "vpc_id" { 
    value = aws_vpc.vpc.id
}

output "public_subnet_ids" { 
    value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" { 
    value = aws_subnet.private_subnet.*.id
}

output "public_subnet_cidr" { 
    value = aws_subnet.public_subnet.*.cidr_block
}

output "private_subnet_cidr" { 
    value = aws_subnet.private_subnet.*.cidr_block
}   

output "igw_id" { 
    value = aws_internet_gateway.igw.id
}       

output "nat_id" { 
    value = aws_nat_gateway.nat.id
}

output "vpc_security_group_ids" { 
    value = [aws_security_group.ecs_sg.id]
}

output "alb_security_group_id" {    
    value = aws_security_group.alb_sg.id
}

