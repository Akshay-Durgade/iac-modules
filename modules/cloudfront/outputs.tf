output "cf_arn" {
  value = aws_cloudfront_distribution.s3_distribution.arn
}

output "oac_id" {
  value = aws_cloudfront_origin_access_control.example.id
}