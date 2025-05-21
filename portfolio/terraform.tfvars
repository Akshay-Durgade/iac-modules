########################
## S3
########################
s3_bucket_name            = "portfoliowebsiteakshaydurgade"
website_bucket            = true
s3_bucket_force_destroy   = true
s3_bucket_index_document  = {
  suffix                  = "index.html"
}
s3_bucket_error_document  = {
    key                   = "error.html"
  }

########################
## OAC
########################
oac_description                       = "For React Portfolio"
oac_name                              = "s3originaccess"
oac_origin_access_control_origin_type = "s3"
oac_signing_protocol                  = "sigv4"
oac_signing_behavior                  = "always"

########################
## CloudFront
########################
cf_aliases                                          = []
cf_comment                                          = "CloudFront for Personal Portfolio"
cf_default_root_object                              = "index.html"
cf_enabled                                          = true
cf_is_ipv6_enabled                                  = false
cf_origin_id                                        = "Portfolio Origin"
cf_price_class                                      = "PriceClass_200"
cf_default_cache_behavior_allowed_methods           = ["GET", "HEAD"]
cf_default_cache_behavior_viewer_protocol_policy    = "allow-all"
cf_default_cache_behavior_enable_compress           = false
cf_default_cache_behavior_cache_policy_id           = "658327ea-f89d-4fab-a63d-7e88639e58f6"
