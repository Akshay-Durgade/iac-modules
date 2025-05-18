variable "oidc_url" {
  type = string
  default = "https://token.actions.githubusercontent.com"
}

variable "oidc_client_id_list" {
  type = list(string)
  default = [ "sts.amazonaws.com" ]
}

variable "oidc_thumbprint_list" {
  type = list(string)
  default = [ "ffffffffffffffffffffffffffffffffffffffff" ]
}