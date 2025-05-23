variable "iam_policies" {
  description = "A map of IAM policy metadata and file paths"
  type = map(object({
    path         = string
    description  = string
    policy_file  = string
  }))
}