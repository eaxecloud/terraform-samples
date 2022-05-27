variable "test_bucket_name" {
  description = "Name of test bucket"
  type        = string
  default     = "my-bucket"
}

variable "simple_demo_bucket_name" {
  description = "Name of simple demo bucket"
  type        = string
  default     = "my-simple-demo-bucket"
}

variable "simple_demo_bucket_acl" {
  description = "Acl of simple_demo_bucket"
  type        = string
  default     = "private"
}

variable "simple_demo_website_bucket_name" {
  description = "Name of my-simple-demo-website-bucket"
  type        = string
  default     = "my-simple-demo-website-bucket"
}

variable "simple_demo_website_args" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    index_document     = "index.html",
    error_document = "error.html"
    routing_rule_cond_key_prefix_equals = "docs/"
    routing_rule_redirect_replace_key_prefix_with = "documents/"
  }
}

variable "simple_demo_cors_bucket_name" {
  description = "Name of simple_demo_versioning_bucket_name"
  type        = string
  default     = "simple-demo-cors-bucket"
}

variable "simple_demo_versioning_bucket_name" {
  description = "Name of simple_demo_versioning_bucket_name"
  type        = string
  default     = "simple-demo-versioning-bucket"
}

variable "simple_demo_versioning_bucket_status" {
  description = "Status of simple_demo_versioning_bucket_status"
  type        = string
  default     = "Enabled"
}

variable "simple_demo_logging_bucket_name" {
  description = "Name of simple_demo_logging_bucket_name"
  type        = string
  default     = "simple-demo-logging-bucket"
}

variable "simple_demo_logging_target_bucket_name" {
  description = "Name of simple_demo_logging_target_bucket_name"
  type        = string
  default     = "simple-demo-logging-target-bucket"
}

variable "simple_demo_logging_target_bucket_acl" {
  description = "Name of simple_demo_logging_target_bucket_acl"
  type        = string
  default     = "log-delivery-write"
}

variable "simple_demo_logging_target_prefix" {
  description = "Name of simple_demo_cors_bucket_name"
  type        = string
  default     = "log/"
}


