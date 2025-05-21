resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = var.s3_bucket_force_destroy
  tags          = var.s3_bucket_tags
}

resource "aws_s3_bucket_website_configuration" "s3_configs" {
  count = var.website_bucket ? 1 : 0
  bucket    = aws_s3_bucket.s3_bucket.id
  index_document {
    suffix  = var.s3_bucket_index_document.suffix
  }
  error_document {
    key     = var.s3_bucket_error_document.key
  }
}

resource "aws_s3_bucket_public_access_block" "s3_block_access" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

