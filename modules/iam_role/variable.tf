variable "iam_role_name" {
  type = string
}

variable "iam_role_assume_role_policy" {
  type = string
}

variable "iam_role_managed_role_policy_arn" {
  type = list(string)
}