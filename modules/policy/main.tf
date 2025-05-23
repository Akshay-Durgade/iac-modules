resource "aws_iam_policy" "policies" {
  for_each    = var.iam_policies

  name        = each.key
  path        = each.value.path
  description = each.value.description
  policy      = file(each.value.policy_file)
}
