variable "repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "image_count" {
  description = "Number of images to keep"
  type        = number
}
