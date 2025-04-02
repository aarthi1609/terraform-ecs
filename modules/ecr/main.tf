resource "aws_ecr_repository" "repo" {
  name            = var.repo_name
  image_tag_mutability = "IMMUTABLE" 
  encryption_configuration {
    encryption_type = "AES256"
  } 
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "lifecycle" {
  repository = aws_ecr_repository.repo.name
  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep only last 5 images",
        selection = {
          countType     = "imageCountMoreThan",
          countNumber   = var.image_count,
          tagStatus     = "any"
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}