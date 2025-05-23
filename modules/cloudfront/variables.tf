########################
## OAC
########################
variable "oac_name" {
  description = "A name that identifies the Origin Access Control."
  type = string
}

variable "oac_description" {
  description = "The description of the Origin Access Control. Defaults to 'Managed by Terraform' if omitted."
  type = string
  default = "Managed by Terraform"
}

variable "oac_origin_access_control_origin_type" {
  description = "(Required) The type of origin that this Origin Access Control is for. Valid values are lambda, mediapackagev2, mediastore, and s3."
  type = string
}

variable "oac_signing_behavior" {
  description = "(Required) Specifies which requests CloudFront signs. Specify always for the most common use case. Allowed values: always, never, and no-override."
  type = string
}

variable "oac_signing_protocol" {
  description = "Determines how CloudFront signs (authenticates) requests. The only valid value is sigv4."
  type = string
}

########################
## CloudFront
########################

variable "cf_domain_name" {
  description = "(Required) - DNS domain name of either the S3 bucket, or web site of your custom origin."
  type = string
}

variable "cf_origin_id" {
  description = "(Required) - Unique identifier for the origin."
  type = string
}

variable "cf_enabled" {
  description = "(Required) - Whether the distribution is enabled to accept end user requests for content."
  type = bool
  default = true
}

variable "cf_is_ipv6_enabled" {
  description = "(Optional) - Whether the IPv6 is enabled for the distribution."
  type = bool
  default = false
}

variable "cf_comment" {
  description = "(Optional) - Any comments you want to include about the distribution."
  type = string
}

variable "cf_default_root_object" {
  description = "(Optional) - Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type = string
}

variable "cf_aliases" {
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
  type = list(string)
}

variable "cf_default_cache_behavior_allowed_methods" {
  description = "(Required) Default cache behavior for this distribution."
  type = list(string)
  default = ["GET", "POST"]
}

variable "cf_default_cache_behavior_cached_methods" {
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "cf_default_cache_behavior_target_origin_id" {
  type = string
}

variable "cf_default_cache_behavior_viewer_protocol_policy" {
  type = string
  default = "allow-all"
}

variable "cf_default_cache_behavior_min_ttl" {
  type = number
  default = 0
}

variable "cf_default_cache_behavior_default_ttl" {
  type = number
  default = 3600
}

variable "cf_default_cache_behavior_max_ttl" {
  type = number
  default = 86400
}

variable "cf_price_class" {
  description = "(Optional) - Price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100."
  type = string
}

variable "cf_restrictions_geo_restriction_restriction_type" {
  type = string
  default = "whitelist"
}

variable "cf_restrictions_geo_restriction_locations" {
  type = list(string)
  default = ["IN"]
}

variable "cf_default_cache_behavior_enable_compress" {
  type = bool
  default = false
}

variable "cf_default_cache_behavior_cache_policy_id" {
  type = string
  default = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    CreatedBy = "AkshayDurgade"
    CreatedUsing = "Terraform"
  }
}