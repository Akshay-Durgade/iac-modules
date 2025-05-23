resource "aws_cloudfront_origin_access_control" "example" {
  name                              = var.oac_name
  description                       = var.oac_description
  origin_access_control_origin_type = var.oac_origin_access_control_origin_type
  signing_behavior                  = var.oac_signing_behavior
  signing_protocol                  = var.oac_signing_protocol
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = var.cf_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.example.id
    origin_id                = var.cf_origin_id
  }

  enabled             = var.cf_enabled
  is_ipv6_enabled     = var.cf_is_ipv6_enabled
  comment             = var.cf_comment
  default_root_object = var.cf_default_root_object

  aliases = var.cf_aliases

  default_cache_behavior {      
  allowed_methods        = var.cf_default_cache_behavior_allowed_methods
  cached_methods         = var.cf_default_cache_behavior_cached_methods
  target_origin_id       = var.cf_default_cache_behavior_target_origin_id
  compress               = var.cf_default_cache_behavior_enable_compress
  cache_policy_id        = var.cf_default_cache_behavior_cache_policy_id

  viewer_protocol_policy = var.cf_default_cache_behavior_viewer_protocol_policy
  min_ttl                = var.cf_default_cache_behavior_min_ttl
  default_ttl            = var.cf_default_cache_behavior_default_ttl
  max_ttl                = var.cf_default_cache_behavior_max_ttl
}

  price_class = var.cf_price_class

  restrictions {
    geo_restriction {
      restriction_type = var.cf_restrictions_geo_restriction_restriction_type
      locations        = var.cf_restrictions_geo_restriction_locations
    }
  }

  tags = var.tags

  viewer_certificate {
    cloudfront_default_certificate = true
  }
  depends_on = [ aws_cloudfront_origin_access_control.example ]
}