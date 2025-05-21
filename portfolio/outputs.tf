output "s3_bucket_id" {
  value = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_regional_domain_name" {
  value = module.s3_bucket.s3_bucket_regional_domain_name
}

output "website_endpoint" {
  value = module.s3_bucket.website_endpoint
}

output "arn" {
  value = module.s3_bucket.arn
}

output "website_endpoint1" {
  value = module.s3_bucket.website_endpoint1
}

output "cf_arn" {
  value = module.cloudfront.cf_arn
}