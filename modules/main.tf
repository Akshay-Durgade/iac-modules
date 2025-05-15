resource "aws_ecr_repository" "ecr" {
  name                 = var.aws_ecr_repository_name
  image_tag_mutability = var.aws_ecr_repository_image_tag_mutability
  force_delete = var.aws_ecr_repository_force_delete
  encryption_configuration {
    encryption_type = var.aws_ecr_repository_encryption_configuration.encryption_type
    kms_key = var.aws_ecr_repository_encryption_configuration.kms_key
  }
  image_scanning_configuration {
    scan_on_push = var.aws_ecr_repository_image_scanning_configuration_scan_on_push
  }
}