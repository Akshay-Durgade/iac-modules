output "iam_policy_arns" {
  description = "ARNs of the created IAM policies"
  value = { for k, p in aws_iam_policy.policies : k => p.arn }
}
