output "s3_bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "website_endpoint1" {
  value = aws_s3_bucket.s3_bucket.website_endpoint
}

output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_configs[0].website_endpoint
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_domain_name
}