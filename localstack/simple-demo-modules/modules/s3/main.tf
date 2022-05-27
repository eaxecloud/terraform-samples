resource "aws_s3_bucket" "test-bucket" {
  bucket = var.test_bucket_name
}

# With ACL
resource "aws_s3_bucket" "simple-demo-bucket" {
  bucket = var.simple_demo_bucket_name
}

resource "aws_s3_bucket_acl" "simple-demo-bucket_acl" {
  bucket = aws_s3_bucket.simple-demo-bucket.id
  acl    = var.simple_demo_bucket_acl
}

# Website
resource "aws_s3_bucket" "simple-demo-website" {
  bucket = var.simple_demo_website_bucket_name
}
resource "aws_s3_bucket_website_configuration" "simple-demo-website-with-routeing-rule" {
  bucket = aws_s3_bucket.simple-demo-website.bucket

  index_document {
    suffix = var.simple_demo_website_args["index_document"]
  }

  error_document {
    key = var.simple_demo_website_args["error_document"]
  }

  routing_rule {
    condition {
      key_prefix_equals = var.simple_demo_website_args["routing_rule_cond_key_prefix_equals"]
    }
    redirect {
      replace_key_prefix_with = var.simple_demo_website_args["routing_rule_redirect_replace_key_prefix_with"]
    }
  }
}

# cors
resource "aws_s3_bucket" "simple-demo-cors" {
  bucket = var.simple_demo_cors_bucket_name
}

resource "aws_s3_bucket_cors_configuration" "simple-demo-cors" {
  bucket = aws_s3_bucket.simple-demo-cors.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

#
resource "aws_s3_bucket" "simple-demo-versioning" {
  bucket = var.simple_demo_versioning_bucket_name
}

resource "aws_s3_bucket_acl" "simple-demo-versioning" {
  bucket = aws_s3_bucket.simple-demo-versioning.id
  acl    = var.simple_demo_bucket_acl
}

resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
  bucket = aws_s3_bucket.simple-demo-versioning.id
  versioning_configuration {
    status = var.simple_demo_versioning_bucket_status
  }
}

# logging
resource "aws_s3_bucket" "simple-demo-logging" {
  bucket = var.simple_demo_logging_bucket_name
}

resource "aws_s3_bucket_acl" "simple-demo-logging" {
  bucket = aws_s3_bucket.simple-demo-logging.id
  acl    = var.simple_demo_bucket_acl
}

resource "aws_s3_bucket" "simple-demo-logging-target" {
  bucket = var.simple_demo_logging_target_bucket_name
}

resource "aws_s3_bucket_acl" "simple-demo-logging-target_acl" {
  bucket = aws_s3_bucket.simple-demo-logging-target.id
  acl    = var.simple_demo_logging_target_bucket_acl
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.simple-demo-logging.id

  target_bucket = aws_s3_bucket.simple-demo-logging-target.id
  target_prefix = var.simple_demo_logging_target_prefix
}