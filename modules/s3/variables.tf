variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  validation {
    condition = (
      length(var.s3_bucket_name) >= 3 &&
      length(var.s3_bucket_name) <= 63 &&
      // Only lowercase letters, numbers, dots, and hyphens; must start/end with alphanumeric
      can(regex("^[a-z0-9]([a-z0-9.-]*[a-z0-9])?$", var.s3_bucket_name)) &&
      // No consecutive dots
      !can(regex("\\.\\.", var.s3_bucket_name)) &&
      // No leading/trailing hyphen
      !startswith(var.s3_bucket_name, "-") &&
      !endswith(var.s3_bucket_name, "-")
    )

    error_message = <<EOT
Invalid S3 bucket name. It must:
- Be between 3 and 63 characters
- Only use lowercase letters, numbers, hyphens (-), and periods (.)
- Start and end with a lowercase letter or number
- Not contain consecutive periods (..)
- Not start or end with a hyphen (-)
EOT
  }
}

variable "s3_bucket_force_destroy" {
  type = bool
  default = false
}

variable "s3_bucket_tags" {
  type = map(string)
  default = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "website_bucket" {
  type = bool
  default = false
}

variable "s3_bucket_index_document" {
  type = object({
    suffix = string
  })
  default = {
    suffix = "index.html"
  }
}

variable "s3_bucket_error_document" {
  type = object({
    key = string
  })
  default = {
    key = "error.html"
  }
}