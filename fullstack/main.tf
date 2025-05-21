module "ecr_repo" {
  source                                                        = "../modules/ecr"
  aws_ecr_repository_name                                       = var.aws_ecr_repository_name
  aws_ecr_repository_force_delete                               = var.aws_ecr_repository_force_delete
  aws_ecr_repository_image_scanning_configuration_scan_on_push  = var.aws_ecr_repository_image_scanning_configuration_scan_on_push
  aws_ecr_repository_image_tag_mutability                       = var.aws_ecr_repository_image_tag_mutability
  aws_ecr_repository_encryption_configuration                   = var.aws_ecr_repository_encryption_configuration
}

module "oidc" {
  source = "../modules/oidc"
}

module "oidc_trust_relationship" {
  source                            = "../modules/iam_role"
  iam_role_name                     = var.iam_role_name
  iam_role_assume_role_policy       = data.aws_iam_policy_document.trusted_policy.json
  iam_role_managed_role_policy_arn  = [ "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess" ]
  depends_on                        = [ module.oidc ]
}