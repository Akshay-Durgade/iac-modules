resource "aws_ecr_repository" "ecr" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  encryption_configuration {
    encryption_type = "AES256"
    kms_key = ""
  }
  image_scanning_configuration {
    scan_on_push = false
  }
}