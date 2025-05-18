resource "aws_iam_openid_connect_provider" "default" {
  url = var.oidc_url
  client_id_list = var.oidc_client_id_list
  thumbprint_list = var.oidc_thumbprint_list
}