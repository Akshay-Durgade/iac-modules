resource "aws_iam_role" "role" {
  name = var.iam_role_name
  assume_role_policy = var.iam_role_assume_role_policy
}

resource "aws_iam_role_policy_attachment" "managed_policy_attach" {
  for_each = toset(var.iam_role_managed_role_policy_arn)
  role       = aws_iam_role.role.name
  policy_arn = each.value
}