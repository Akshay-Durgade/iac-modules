data "aws_iam_policy_document" "allow_access_from_cloudfront" {
  version = "2008-10-17"
  statement {
    sid = "AllowCloudFrontServicePrincipal"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      module.s3_bucket.arn,
      "${module.s3_bucket.arn}/*",
    ]

    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [module.cloudfront.cf_arn]
    }
  }
}