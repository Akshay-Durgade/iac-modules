module "s3_bucket" {
  source                    = "../modules/s3"
  s3_bucket_name            = var.s3_bucket_name
  website_bucket            = var.website_bucket 
  s3_bucket_force_destroy   = var.s3_bucket_force_destroy
  s3_bucket_index_document  = var.s3_bucket_index_document
  s3_bucket_error_document  = var.s3_bucket_error_document
}

module "cloudfront" {
  source                                                      = "../modules/cloudfront"
  oac_description                                             = var.oac_description
  oac_name                                                    = var.oac_name
  oac_origin_access_control_origin_type                       = var.oac_origin_access_control_origin_type
  oac_signing_protocol                                        = var.oac_signing_protocol
  oac_signing_behavior                                        = var.oac_signing_behavior
  cf_domain_name                                              = module.s3_bucket.s3_bucket_regional_domain_name
  cf_default_cache_behavior_target_origin_id                  = var.cf_origin_id
  cf_aliases                                                  = var.cf_aliases
  cf_comment                                                  = var.cf_comment
  cf_default_root_object                                      = var.cf_default_root_object
  cf_enabled                                                  = var.cf_enabled
  cf_is_ipv6_enabled                                          = var.cf_is_ipv6_enabled
  cf_origin_id                                                = var.cf_origin_id
  cf_price_class                                              = var.cf_price_class
  cf_default_cache_behavior_allowed_methods                   = var.cf_default_cache_behavior_allowed_methods
  cf_default_cache_behavior_cached_methods                    = var.cf_default_cache_behavior_cached_methods
  # cf_default_cache_behavior_forwarded_values_query_string     = var.cf_default_cache_behavior_forwarded_values_query_string
  # cf_default_cache_behavior_forwarded_values_cookies_forward  = var.cf_default_cache_behavior_forwarded_values_cookies_forward
  cf_default_cache_behavior_viewer_protocol_policy            = var.cf_default_cache_behavior_viewer_protocol_policy
  cf_default_cache_behavior_min_ttl                           = var.cf_default_cache_behavior_min_ttl
  cf_default_cache_behavior_default_ttl                       = var.cf_default_cache_behavior_default_ttl
  cf_default_cache_behavior_max_ttl                           = var.cf_default_cache_behavior_max_ttl
  cf_restrictions_geo_restriction_restriction_type            = var.cf_restrictions_geo_restriction_restriction_type
  cf_restrictions_geo_restriction_locations                   = var.cf_restrictions_geo_restriction_locations
  cf_default_cache_behavior_enable_compress                   = var.cf_default_cache_behavior_enable_compress
  cf_default_cache_behavior_cache_policy_id                   = var.cf_default_cache_behavior_cache_policy_id
  depends_on = [ module.s3_bucket ]
}

resource "aws_s3_bucket_policy" "allow_access_from_cf" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
  depends_on = [ module.s3_bucket ,module.cloudfront ]
}