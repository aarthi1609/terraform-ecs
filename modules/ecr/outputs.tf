#outputs ecr repo arn
output "ecr_repo_arn" { 
  value = aws_ecr_repository.repo.arn
}

#outputs ecr repo url       
output "ecr_repo_url" { 
  value = aws_ecr_repository.repo.repository_url        
}

