# 简要描述

这个模块演示了如何使用terraform在localstack上创建资源。因为主要是为了演示用法，因此只创建了很少的资源类型，S3，SNS，SQS和DynamoDB Table。

功能与模块simple-demo-modules相同，但是没有分模块，也没有把变量等分离出来，所有的代码都写在同一个文件中。这种方式不推荐，不清晰，不易维护。

# 如何使用

## 1、首先打开一个Terminal窗口，然后切换到此目录

```
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo
```

## 2、执行terrafrom init

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.15.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo
```

## 3、执行terrafrom plan

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.simple-demo-dynamodb-global-table will be created
  + resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "TestTableHashKey"
      + id               = (known after apply)
      + name             = "simple-demo-dynamodb-global-table"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_enabled   = true
      + stream_label     = (known after apply)
      + stream_view_type = "NEW_AND_OLD_IMAGES"
      + tags_all         = (known after apply)
      + write_capacity   = (known after apply)

      + attribute {
          + name = "TestTableHashKey"
          + type = "S"
        }

      + point_in_time_recovery {
          + enabled = (known after apply)
        }

      + replica {
          + kms_key_arn = (known after apply)
          + region_name = "us-east-2"
        }
      + replica {
          + kms_key_arn = (known after apply)
          + region_name = "us-west-2"
        }

      + server_side_encryption {
          + enabled     = (known after apply)
          + kms_key_arn = (known after apply)
        }

      + ttl {
          + attribute_name = (known after apply)
          + enabled        = (known after apply)
        }
    }

  # aws_dynamodb_table.simple-demo-dynamodb-table will be created
  + resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
      + arn              = (known after apply)
      + billing_mode     = "PROVISIONED"
      + hash_key         = "UserId"
      + id               = (known after apply)
      + name             = "GameScores"
      + range_key        = "GameTitle"
      + read_capacity    = 20
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "Name"        = "simple-demo-dynamodb-table"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "Name"        = "simple-demo-dynamodb-table"
        }
      + write_capacity   = 20

      + attribute {
          + name = "GameTitle"
          + type = "S"
        }
      + attribute {
          + name = "TopScore"
          + type = "N"
        }
      + attribute {
          + name = "UserId"
          + type = "S"
        }

      + global_secondary_index {
          + hash_key           = "GameTitle"
          + name               = "GameTitleIndex"
          + non_key_attributes = [
              + "UserId",
            ]
          + projection_type    = "INCLUDE"
          + range_key          = "TopScore"
          + read_capacity      = 10
          + write_capacity     = 10
        }

      + point_in_time_recovery {
          + enabled = (known after apply)
        }

      + server_side_encryption {
          + enabled     = (known after apply)
          + kms_key_arn = (known after apply)
        }

      + ttl {
          + attribute_name = "TimeToExist"
          + enabled        = false
        }
    }

  # aws_s3_bucket.simple-demo-bucket will be created
  + resource "aws_s3_bucket" "simple-demo-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-simple-demo-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-cors will be created
  + resource "aws_s3_bucket" "simple-demo-cors" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-cors-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-logging will be created
  + resource "aws_s3_bucket" "simple-demo-logging" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-logging-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-logging-target will be created
  + resource "aws_s3_bucket" "simple-demo-logging-target" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-logging-target-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-versioning will be created
  + resource "aws_s3_bucket" "simple-demo-versioning" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-versioning-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-website will be created
  + resource "aws_s3_bucket" "simple-demo-website" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-simple-demo-website-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.test-bucket will be created
  + resource "aws_s3_bucket" "test-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket_acl.simple-demo-bucket_acl will be created
  + resource "aws_s3_bucket_acl" "simple-demo-bucket_acl" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging will be created
  + resource "aws_s3_bucket_acl" "simple-demo-logging" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging-target_acl will be created
  + resource "aws_s3_bucket_acl" "simple-demo-logging-target_acl" {
      + acl    = "log-delivery-write"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-versioning will be created
  + resource "aws_s3_bucket_acl" "simple-demo-versioning" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_cors_configuration.simple-demo-cors will be created
  + resource "aws_s3_bucket_cors_configuration" "simple-demo-cors" {
      + bucket = "simple-demo-cors-bucket"
      + id     = (known after apply)

      + cors_rule {
          + allowed_headers = [
              + "*",
            ]
          + allowed_methods = [
              + "POST",
              + "PUT",
            ]
          + allowed_origins = [
              + "https://s3-website-test.hashicorp.com",
            ]
          + expose_headers  = [
              + "ETag",
            ]
          + max_age_seconds = 3000
        }
      + cors_rule {
          + allowed_headers = []
          + allowed_methods = [
              + "GET",
            ]
          + allowed_origins = [
              + "*",
            ]
          + expose_headers  = []
        }
    }

  # aws_s3_bucket_logging.example will be created
  + resource "aws_s3_bucket_logging" "example" {
      + bucket        = (known after apply)
      + id            = (known after apply)
      + target_bucket = (known after apply)
      + target_prefix = "log/"
    }

  # aws_s3_bucket_versioning.simple-demo-versioning will be created
  + resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

  # aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule will be created
  + resource "aws_s3_bucket_website_configuration" "simple-demo-website-with-routeing-rule" {
      + bucket           = "my-simple-demo-website-bucket"
      + id               = (known after apply)
      + routing_rules    = (known after apply)
      + website_domain   = (known after apply)
      + website_endpoint = (known after apply)

      + error_document {
          + key = "error.html"
        }

      + index_document {
          + suffix = "index.html"
        }

      + routing_rule {
          + condition {
              + key_prefix_equals = "docs/"
            }

          + redirect {
              + replace_key_prefix_with = "documents/"
            }
        }
    }

  # aws_sns_topic.order-created-topic will be created
  + resource "aws_sns_topic" "order-created-topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = false
      + delivery_policy             = jsonencode(
            {
              + http = {
                  + defaultHealthyRetryPolicy    = {
                      + backoffFunction    = "linear"
                      + maxDelayTarget     = 20
                      + minDelayTarget     = 20
                      + numMaxDelayRetries = 0
                      + numMinDelayRetries = 0
                      + numNoDelayRetries  = 0
                      + numRetries         = 3
                    }
                  + defaultThrottlePolicy        = {
                      + maxReceivesPerSecond = 1
                    }
                  + disableSubscriptionOverrides = false
                }
            }
        )
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = "order-created-topic"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags_all                    = (known after apply)
    }

  # aws_sns_topic.simple-demo-topic will be created
  + resource "aws_sns_topic" "simple-demo-topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = true
      + fifo_topic                  = true
      + id                          = (known after apply)
      + name                        = "simple-demo-topic.fifo"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags_all                    = (known after apply)
    }

  # aws_sqs_queue.simple-demo-queue-fifo will be created
  + resource "aws_sqs_queue" "simple-demo-queue-fifo" {
      + arn                               = (known after apply)
      + content_based_deduplication       = true
      + deduplication_scope               = (known after apply)
      + delay_seconds                     = 0
      + fifo_queue                        = true
      + fifo_throughput_limit             = (known after apply)
      + id                                = (known after apply)
      + kms_data_key_reuse_period_seconds = (known after apply)
      + max_message_size                  = 262144
      + message_retention_seconds         = 345600
      + name                              = "simple-demo-queue.fifo"
      + name_prefix                       = (known after apply)
      + policy                            = (known after apply)
      + receive_wait_time_seconds         = 0
      + tags_all                          = (known after apply)
      + url                               = (known after apply)
      + visibility_timeout_seconds        = 30
    }

  # aws_sqs_queue.simple-demo-queue-high-throughput-fifo will be created
  + resource "aws_sqs_queue" "simple-demo-queue-high-throughput-fifo" {
      + arn                               = (known after apply)
      + content_based_deduplication       = false
      + deduplication_scope               = "messageGroup"
      + delay_seconds                     = 0
      + fifo_queue                        = true
      + fifo_throughput_limit             = "perMessageGroupId"
      + id                                = (known after apply)
      + kms_data_key_reuse_period_seconds = (known after apply)
      + max_message_size                  = 262144
      + message_retention_seconds         = 345600
      + name                              = "simple-demo-queue-high-throughput.fifo"
      + name_prefix                       = (known after apply)
      + policy                            = (known after apply)
      + receive_wait_time_seconds         = 0
      + tags_all                          = (known after apply)
      + url                               = (known after apply)
      + visibility_timeout_seconds        = 30
    }

Plan: 21 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>

```



## 4、执行terrafrom apply

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.simple-demo-dynamodb-global-table will be created
  + resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "TestTableHashKey"
      + id               = (known after apply)
      + name             = "simple-demo-dynamodb-global-table"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_enabled   = true
      + stream_label     = (known after apply)
      + stream_view_type = "NEW_AND_OLD_IMAGES"
      + tags_all         = (known after apply)
      + write_capacity   = (known after apply)

      + attribute {
          + name = "TestTableHashKey"
          + type = "S"
        }

      + point_in_time_recovery {
          + enabled = (known after apply)
        }

      + replica {
          + kms_key_arn = (known after apply)
          + region_name = "us-east-2"
        }
      + replica {
          + kms_key_arn = (known after apply)
          + region_name = "us-west-2"
        }

      + server_side_encryption {
          + enabled     = (known after apply)
          + kms_key_arn = (known after apply)
        }

      + ttl {
          + attribute_name = (known after apply)
          + enabled        = (known after apply)
        }
    }

  # aws_dynamodb_table.simple-demo-dynamodb-table will be created
  + resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
      + arn              = (known after apply)
      + billing_mode     = "PROVISIONED"
      + hash_key         = "UserId"
      + id               = (known after apply)
      + name             = "GameScores"
      + range_key        = "GameTitle"
      + read_capacity    = 20
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "Name"        = "simple-demo-dynamodb-table"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "Name"        = "simple-demo-dynamodb-table"
        }
      + write_capacity   = 20

      + attribute {
          + name = "GameTitle"
          + type = "S"
        }
      + attribute {
          + name = "TopScore"
          + type = "N"
        }
      + attribute {
          + name = "UserId"
          + type = "S"
        }

      + global_secondary_index {
          + hash_key           = "GameTitle"
          + name               = "GameTitleIndex"
          + non_key_attributes = [
              + "UserId",
            ]
          + projection_type    = "INCLUDE"
          + range_key          = "TopScore"
          + read_capacity      = 10
          + write_capacity     = 10
        }

      + point_in_time_recovery {
          + enabled = (known after apply)
        }

      + server_side_encryption {
          + enabled     = (known after apply)
          + kms_key_arn = (known after apply)
        }

      + ttl {
          + attribute_name = "TimeToExist"
          + enabled        = false
        }
    }

  # aws_s3_bucket.simple-demo-bucket will be created
  + resource "aws_s3_bucket" "simple-demo-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-simple-demo-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-cors will be created
  + resource "aws_s3_bucket" "simple-demo-cors" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-cors-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-logging will be created
  + resource "aws_s3_bucket" "simple-demo-logging" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-logging-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-logging-target will be created
  + resource "aws_s3_bucket" "simple-demo-logging-target" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-logging-target-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-versioning will be created
  + resource "aws_s3_bucket" "simple-demo-versioning" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "simple-demo-versioning-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.simple-demo-website will be created
  + resource "aws_s3_bucket" "simple-demo-website" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-simple-demo-website-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket.test-bucket will be created
  + resource "aws_s3_bucket" "test-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # aws_s3_bucket_acl.simple-demo-bucket_acl will be created
  + resource "aws_s3_bucket_acl" "simple-demo-bucket_acl" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging will be created
  + resource "aws_s3_bucket_acl" "simple-demo-logging" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging-target_acl will be created
  + resource "aws_s3_bucket_acl" "simple-demo-logging-target_acl" {
      + acl    = "log-delivery-write"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-versioning will be created
  + resource "aws_s3_bucket_acl" "simple-demo-versioning" {
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

  # aws_s3_bucket_cors_configuration.simple-demo-cors will be created
  + resource "aws_s3_bucket_cors_configuration" "simple-demo-cors" {
      + bucket = "simple-demo-cors-bucket"
      + id     = (known after apply)

      + cors_rule {
          + allowed_headers = [
              + "*",
            ]
          + allowed_methods = [
              + "POST",
              + "PUT",
            ]
          + allowed_origins = [
              + "https://s3-website-test.hashicorp.com",
            ]
          + expose_headers  = [
              + "ETag",
            ]
          + max_age_seconds = 3000
        }
      + cors_rule {
          + allowed_headers = []
          + allowed_methods = [
              + "GET",
            ]
          + allowed_origins = [
              + "*",
            ]
          + expose_headers  = []
        }
    }

  # aws_s3_bucket_logging.example will be created
  + resource "aws_s3_bucket_logging" "example" {
      + bucket        = (known after apply)
      + id            = (known after apply)
      + target_bucket = (known after apply)
      + target_prefix = "log/"
    }

  # aws_s3_bucket_versioning.simple-demo-versioning will be created
  + resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

  # aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule will be created
  + resource "aws_s3_bucket_website_configuration" "simple-demo-website-with-routeing-rule" {
      + bucket           = "my-simple-demo-website-bucket"
      + id               = (known after apply)
      + routing_rules    = (known after apply)
      + website_domain   = (known after apply)
      + website_endpoint = (known after apply)

      + error_document {
          + key = "error.html"
        }

      + index_document {
          + suffix = "index.html"
        }

      + routing_rule {
          + condition {
              + key_prefix_equals = "docs/"
            }

          + redirect {
              + replace_key_prefix_with = "documents/"
            }
        }
    }

  # aws_sns_topic.order-created-topic will be created
  + resource "aws_sns_topic" "order-created-topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = false
      + delivery_policy             = jsonencode(
            {
              + http = {
                  + defaultHealthyRetryPolicy    = {
                      + backoffFunction    = "linear"
                      + maxDelayTarget     = 20
                      + minDelayTarget     = 20
                      + numMaxDelayRetries = 0
                      + numMinDelayRetries = 0
                      + numNoDelayRetries  = 0
                      + numRetries         = 3
                    }
                  + defaultThrottlePolicy        = {
                      + maxReceivesPerSecond = 1
                    }
                  + disableSubscriptionOverrides = false
                }
            }
        )
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = "order-created-topic"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags_all                    = (known after apply)
    }

  # aws_sns_topic.simple-demo-topic will be created
  + resource "aws_sns_topic" "simple-demo-topic" {
      + arn                         = (known after apply)
      + content_based_deduplication = true
      + fifo_topic                  = true
      + id                          = (known after apply)
      + name                        = "simple-demo-topic.fifo"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + tags_all                    = (known after apply)
    }

  # aws_sqs_queue.simple-demo-queue-fifo will be created
  + resource "aws_sqs_queue" "simple-demo-queue-fifo" {
      + arn                               = (known after apply)
      + content_based_deduplication       = true
      + deduplication_scope               = (known after apply)
      + delay_seconds                     = 0
      + fifo_queue                        = true
      + fifo_throughput_limit             = (known after apply)
      + id                                = (known after apply)
      + kms_data_key_reuse_period_seconds = (known after apply)
      + max_message_size                  = 262144
      + message_retention_seconds         = 345600
      + name                              = "simple-demo-queue.fifo"
      + name_prefix                       = (known after apply)
      + policy                            = (known after apply)
      + receive_wait_time_seconds         = 0
      + tags_all                          = (known after apply)
      + url                               = (known after apply)
      + visibility_timeout_seconds        = 30
    }

  # aws_sqs_queue.simple-demo-queue-high-throughput-fifo will be created
  + resource "aws_sqs_queue" "simple-demo-queue-high-throughput-fifo" {
      + arn                               = (known after apply)
      + content_based_deduplication       = false
      + deduplication_scope               = "messageGroup"
      + delay_seconds                     = 0
      + fifo_queue                        = true
      + fifo_throughput_limit             = "perMessageGroupId"
      + id                                = (known after apply)
      + kms_data_key_reuse_period_seconds = (known after apply)
      + max_message_size                  = 262144
      + message_retention_seconds         = 345600
      + name                              = "simple-demo-queue-high-throughput.fifo"
      + name_prefix                       = (known after apply)
      + policy                            = (known after apply)
      + receive_wait_time_seconds         = 0
      + tags_all                          = (known after apply)
      + url                               = (known after apply)
      + visibility_timeout_seconds        = 30
    }

Plan: 21 to add, 0 to change, 0 to destroy.
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Creating...
aws_sns_topic.order-created-topic: Creating...
aws_sns_topic.simple-demo-topic: Creating...
aws_s3_bucket.simple-demo-cors: Creating...
aws_dynamodb_table.simple-demo-dynamodb-global-table: Creating...
aws_dynamodb_table.simple-demo-dynamodb-table: Creating...
aws_s3_bucket.simple-demo-logging-target: Creating...
aws_s3_bucket.simple-demo-logging: Creating...
aws_s3_bucket.simple-demo-versioning: Creating...
aws_s3_bucket.simple-demo-website: Creating...
aws_sns_topic.order-created-topic: Creation complete after 0s [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
aws_sns_topic.simple-demo-topic: Creation complete after 1s [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
aws_s3_bucket.test-bucket: Creating...
aws_s3_bucket.simple-demo-bucket: Creating...
aws_dynamodb_table.simple-demo-dynamodb-table: Creation complete after 1s [id=GameScores]
aws_sqs_queue.simple-demo-queue-fifo: Creating...
aws_dynamodb_table.simple-demo-dynamodb-global-table: Creation complete after 1s [id=simple-demo-dynamodb-global-table]
aws_s3_bucket.simple-demo-versioning: Creation complete after 1s [id=simple-demo-versioning-bucket]
aws_s3_bucket.simple-demo-logging-target: Creation complete after 1s [id=simple-demo-logging-target-bucket]
aws_s3_bucket.simple-demo-logging: Creation complete after 1s [id=simple-demo-logging-bucket]
aws_s3_bucket.simple-demo-cors: Creation complete after 1s [id=simple-demo-cors-bucket]
aws_s3_bucket.simple-demo-website: Creation complete after 1s [id=my-simple-demo-website-bucket]
aws_s3_bucket_acl.simple-demo-versioning: Creating...
aws_s3_bucket_versioning.simple-demo-versioning: Creating...
aws_s3_bucket_acl.simple-demo-logging-target_acl: Creating...
aws_s3_bucket_acl.simple-demo-versioning: Creation complete after 0s [id=simple-demo-versioning-bucket,private]
aws_s3_bucket_acl.simple-demo-logging: Creating...
aws_s3_bucket_logging.example: Creating...
aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Creating...
aws_s3_bucket_cors_configuration.simple-demo-cors: Creating...
aws_s3_bucket.test-bucket: Creation complete after 0s [id=my-bucket]
aws_s3_bucket_acl.simple-demo-logging-target_acl: Creation complete after 0s [id=simple-demo-logging-target-bucket,log-delivery-write]
aws_s3_bucket.simple-demo-bucket: Creation complete after 1s [id=my-simple-demo-bucket]
aws_s3_bucket_logging.example: Creation complete after 1s [id=simple-demo-logging-bucket]
aws_s3_bucket_acl.simple-demo-logging: Creation complete after 1s [id=simple-demo-logging-bucket,private]
aws_s3_bucket_acl.simple-demo-bucket_acl: Creating...
aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Creation complete after 1s [id=my-simple-demo-website-bucket]
aws_s3_bucket_cors_configuration.simple-demo-cors: Creation complete after 1s [id=simple-demo-cors-bucket]
aws_s3_bucket_acl.simple-demo-bucket_acl: Creation complete after 0s [id=my-simple-demo-bucket,private]
aws_s3_bucket_versioning.simple-demo-versioning: Creation complete after 2s [id=simple-demo-versioning-bucket]
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Still creating... [10s elapsed]
aws_sqs_queue.simple-demo-queue-fifo: Still creating... [10s elapsed]
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Still creating... [20s elapsed]
aws_sqs_queue.simple-demo-queue-fifo: Still creating... [20s elapsed]
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Creation complete after 25s [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
aws_sqs_queue.simple-demo-queue-fifo: Creation complete after 25s [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]

Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>
```



## 5、检查创建的资源

> ssh远程登录到运行Localstack的服务器上运行以下命令

```shell
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 s3 ls
2022-05-31 11:06:16 simple-demo-cors-bucket
2022-05-31 11:06:17 simple-demo-logging-target-bucket
2022-05-31 11:06:17 simple-demo-logging-bucket
2022-05-31 11:06:17 simple-demo-versioning-bucket
2022-05-31 11:06:17 my-simple-demo-website-bucket
2022-05-31 11:06:17 my-bucket
2022-05-31 11:06:17 my-simple-demo-bucket
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sns list-topics
{
    "Topics": [
        {
            "TopicArn": "arn:aws:sns:us-east-1:000000000000:order-created-topic"
        },
        {
            "TopicArn": "arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo"
        }
    ]
}
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sqs list-queues
{
    "QueueUrls": [
        "http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo",
        "http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo"
    ]
}
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 dynamodb list-tables
{
    "TableNames": [
        "GameScores",
        "simple-demo-dynamodb-global-table"
    ]
}

```



## 6、执行terrafrom destroy销毁资源

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>terraform destroy --auto-approve
aws_sns_topic.order-created-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
aws_sns_topic.simple-demo-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
aws_dynamodb_table.simple-demo-dynamodb-global-table: Refreshing state... [id=simple-demo-dynamodb-global-table]
aws_s3_bucket.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
aws_s3_bucket.simple-demo-website: Refreshing state... [id=my-simple-demo-website-bucket]
aws_s3_bucket.simple-demo-logging-target: Refreshing state... [id=simple-demo-logging-target-bucket]
aws_s3_bucket.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
aws_s3_bucket.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket]
aws_s3_bucket.test-bucket: Refreshing state... [id=my-bucket]
aws_sqs_queue.simple-demo-queue-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
aws_s3_bucket.simple-demo-bucket: Refreshing state... [id=my-simple-demo-bucket]
aws_dynamodb_table.simple-demo-dynamodb-table: Refreshing state... [id=GameScores]
aws_s3_bucket_acl.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket,private]
aws_s3_bucket_logging.example: Refreshing state... [id=simple-demo-logging-bucket]
aws_s3_bucket_acl.simple-demo-logging-target_acl: Refreshing state... [id=simple-demo-logging-target-bucket,log-delivery-write]
aws_s3_bucket_versioning.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
aws_s3_bucket_acl.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket,private]
aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Refreshing state... [id=my-simple-demo-website-bucket]
aws_s3_bucket_cors_configuration.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
aws_s3_bucket_acl.simple-demo-bucket_acl: Refreshing state... [id=my-simple-demo-bucket,private]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_dynamodb_table.simple-demo-dynamodb-global-table will be destroyed
  - resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
      - arn              = "arn:aws:dynamodb:us-east-1:000000000000:table/simple-demo-dynamodb-global-table" -> null
      - billing_mode     = "PAY_PER_REQUEST" -> null
      - hash_key         = "TestTableHashKey" -> null
      - id               = "simple-demo-dynamodb-global-table" -> null
      - name             = "simple-demo-dynamodb-global-table" -> null
      - read_capacity    = 0 -> null
      - stream_arn       = "arn:aws:dynamodb:us-east-1:000000000000:table/simple-demo-dynamodb-global-table/stream/2022-05-31T03:06:17.105" -> null
      - stream_enabled   = true -> null
      - stream_label     = "2022-05-31T03:06:17.105" -> null
      - stream_view_type = "NEW_AND_OLD_IMAGES" -> null
      - tags             = {} -> null
      - tags_all         = {} -> null
      - write_capacity   = 0 -> null

      - attribute {
          - name = "TestTableHashKey" -> null
          - type = "S" -> null
        }

      - point_in_time_recovery {
          - enabled = false -> null
        }

      - replica {
          - region_name = "us-east-2" -> null
        }
      - replica {
          - region_name = "us-west-2" -> null
        }

      - ttl {
          - enabled = false -> null
        }
    }

  # aws_dynamodb_table.simple-demo-dynamodb-table will be destroyed
  - resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
      - arn            = "arn:aws:dynamodb:us-east-1:000000000000:table/GameScores" -> null
      - billing_mode   = "PROVISIONED" -> null
      - hash_key       = "UserId" -> null
      - id             = "GameScores" -> null
      - name           = "GameScores" -> null
      - range_key      = "GameTitle" -> null
      - read_capacity  = 20 -> null
      - stream_enabled = false -> null
      - tags           = {
          - "Environment" = "production"
          - "Name"        = "simple-demo-dynamodb-table"
        } -> null
      - tags_all       = {
          - "Environment" = "production"
          - "Name"        = "simple-demo-dynamodb-table"
        } -> null
      - write_capacity = 20 -> null

      - attribute {
          - name = "GameTitle" -> null
          - type = "S" -> null
        }
      - attribute {
          - name = "TopScore" -> null
          - type = "N" -> null
        }
      - attribute {
          - name = "UserId" -> null
          - type = "S" -> null
        }

      - global_secondary_index {
          - hash_key           = "GameTitle" -> null
          - name               = "GameTitleIndex" -> null
          - non_key_attributes = [
              - "UserId",
            ] -> null
          - projection_type    = "INCLUDE" -> null
          - range_key          = "TopScore" -> null
          - read_capacity      = 10 -> null
          - write_capacity     = 10 -> null
        }

      - point_in_time_recovery {
          - enabled = false -> null
        }

      - ttl {
          - attribute_name = "TimeToExist" -> null
          - enabled        = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-bucket will be destroyed
  - resource "aws_s3_bucket" "simple-demo-bucket" {
      - arn                         = "arn:aws:s3:::my-simple-demo-bucket" -> null
      - bucket                      = "my-simple-demo-bucket" -> null
      - bucket_domain_name          = "my-simple-demo-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "my-simple-demo-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "my-simple-demo-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-cors will be destroyed
  - resource "aws_s3_bucket" "simple-demo-cors" {
      - arn                         = "arn:aws:s3:::simple-demo-cors-bucket" -> null
      - bucket                      = "simple-demo-cors-bucket" -> null
      - bucket_domain_name          = "simple-demo-cors-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "simple-demo-cors-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "simple-demo-cors-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - cors_rule {
          - allowed_headers = [] -> null
          - allowed_methods = [
              - "GET",
            ] -> null
          - allowed_origins = [
              - "*",
            ] -> null
          - expose_headers  = [] -> null
          - max_age_seconds = 0 -> null
        }
      - cors_rule {
          - allowed_headers = [
              - "*",
            ] -> null
          - allowed_methods = [
              - "POST",
              - "PUT",
            ] -> null
          - allowed_origins = [
              - "https://s3-website-test.hashicorp.com",
            ] -> null
          - expose_headers  = [
              - "ETag",
            ] -> null
          - max_age_seconds = 3000 -> null
        }

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-logging will be destroyed
  - resource "aws_s3_bucket" "simple-demo-logging" {
      - arn                         = "arn:aws:s3:::simple-demo-logging-bucket" -> null
      - bucket                      = "simple-demo-logging-bucket" -> null
      - bucket_domain_name          = "simple-demo-logging-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "simple-demo-logging-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "simple-demo-logging-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - logging {
          - target_bucket = "simple-demo-logging-target-bucket" -> null
          - target_prefix = "log/" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-logging-target will be destroyed
  - resource "aws_s3_bucket" "simple-demo-logging-target" {
      - arn                         = "arn:aws:s3:::simple-demo-logging-target-bucket" -> null
      - bucket                      = "simple-demo-logging-target-bucket" -> null
      - bucket_domain_name          = "simple-demo-logging-target-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "simple-demo-logging-target-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "simple-demo-logging-target-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - permissions = [
              - "WRITE",
            ] -> null
          - type        = "Group" -> null
          - uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery" -> null
        }
      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-versioning will be destroyed
  - resource "aws_s3_bucket" "simple-demo-versioning" {
      - arn                         = "arn:aws:s3:::simple-demo-versioning-bucket" -> null
      - bucket                      = "simple-demo-versioning-bucket" -> null
      - bucket_domain_name          = "simple-demo-versioning-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "simple-demo-versioning-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "simple-demo-versioning-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = true -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket.simple-demo-website will be destroyed
  - resource "aws_s3_bucket" "simple-demo-website" {
      - arn                         = "arn:aws:s3:::my-simple-demo-website-bucket" -> null
      - bucket                      = "my-simple-demo-website-bucket" -> null
      - bucket_domain_name          = "my-simple-demo-website-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "my-simple-demo-website-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "my-simple-demo-website-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null
      - website_domain              = "s3-website-us-east-1.amazonaws.com" -> null
      - website_endpoint            = "my-simple-demo-website-bucket.s3-website-us-east-1.amazonaws.com" -> null

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }

      - website {
          - error_document = "error.html" -> null
          - index_document = "index.html" -> null
          - routing_rules  = jsonencode(
                [
                  - {
                      - Condition = {
                          - KeyPrefixEquals = "docs/"
                        }
                      - Redirect  = {
                          - ReplaceKeyPrefixWith = "documents/"
                        }
                    },
                ]
            ) -> null
        }
    }

  # aws_s3_bucket.test-bucket will be destroyed
  - resource "aws_s3_bucket" "test-bucket" {
      - arn                         = "arn:aws:s3:::my-bucket" -> null
      - bucket                      = "my-bucket" -> null
      - bucket_domain_name          = "my-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "my-bucket.s3.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z3AQBSTGFYJSTF" -> null
      - id                          = "my-bucket" -> null
      - object_lock_enabled         = false -> null
      - region                      = "us-east-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {} -> null
      - tags_all                    = {} -> null

      - grant {
          - id          = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket_acl.simple-demo-bucket_acl will be destroyed
  - resource "aws_s3_bucket_acl" "simple-demo-bucket_acl" {
      - acl    = "private" -> null
      - bucket = "my-simple-demo-bucket" -> null
      - id     = "my-simple-demo-bucket,private" -> null

      - access_control_policy {
          - grant {
              - permission = "FULL_CONTROL" -> null

              - grantee {
                  - id   = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
                  - type = "CanonicalUser" -> null
                }
            }

          - owner {
              - display_name = "webfile" -> null
              - id           = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging will be destroyed
  - resource "aws_s3_bucket_acl" "simple-demo-logging" {
      - acl    = "private" -> null
      - bucket = "simple-demo-logging-bucket" -> null
      - id     = "simple-demo-logging-bucket,private" -> null

      - access_control_policy {
          - grant {
              - permission = "FULL_CONTROL" -> null

              - grantee {
                  - id   = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
                  - type = "CanonicalUser" -> null
                }
            }

          - owner {
              - display_name = "webfile" -> null
              - id           = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-logging-target_acl will be destroyed
  - resource "aws_s3_bucket_acl" "simple-demo-logging-target_acl" {
      - acl    = "log-delivery-write" -> null
      - bucket = "simple-demo-logging-target-bucket" -> null
      - id     = "simple-demo-logging-target-bucket,log-delivery-write" -> null

      - access_control_policy {
          - grant {
              - permission = "WRITE" -> null

              - grantee {
                  - type = "Group" -> null
                  - uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery" -> null
                }
            }
          - grant {
              - permission = "FULL_CONTROL" -> null

              - grantee {
                  - id   = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
                  - type = "CanonicalUser" -> null
                }
            }

          - owner {
              - display_name = "webfile" -> null
              - id           = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
            }
        }
    }

  # aws_s3_bucket_acl.simple-demo-versioning will be destroyed
  - resource "aws_s3_bucket_acl" "simple-demo-versioning" {
      - acl    = "private" -> null
      - bucket = "simple-demo-versioning-bucket" -> null
      - id     = "simple-demo-versioning-bucket,private" -> null

      - access_control_policy {
          - grant {
              - permission = "FULL_CONTROL" -> null

              - grantee {
                  - id   = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
                  - type = "CanonicalUser" -> null
                }
            }

          - owner {
              - display_name = "webfile" -> null
              - id           = "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a" -> null
            }
        }
    }

  # aws_s3_bucket_cors_configuration.simple-demo-cors will be destroyed
  - resource "aws_s3_bucket_cors_configuration" "simple-demo-cors" {
      - bucket = "simple-demo-cors-bucket" -> null
      - id     = "simple-demo-cors-bucket" -> null

      - cors_rule {
          - allowed_headers = [
              - "*",
            ] -> null
          - allowed_methods = [
              - "POST",
              - "PUT",
            ] -> null
          - allowed_origins = [
              - "https://s3-website-test.hashicorp.com",
            ] -> null
          - expose_headers  = [
              - "ETag",
            ] -> null
          - max_age_seconds = 3000 -> null
        }
      - cors_rule {
          - allowed_headers = [] -> null
          - allowed_methods = [
              - "GET",
            ] -> null
          - allowed_origins = [
              - "*",
            ] -> null
          - expose_headers  = [] -> null
          - max_age_seconds = 0 -> null
        }
    }

  # aws_s3_bucket_logging.example will be destroyed
  - resource "aws_s3_bucket_logging" "example" {
      - bucket        = "simple-demo-logging-bucket" -> null
      - id            = "simple-demo-logging-bucket" -> null
      - target_bucket = "simple-demo-logging-target-bucket" -> null
      - target_prefix = "log/" -> null
    }

  # aws_s3_bucket_versioning.simple-demo-versioning will be destroyed
  - resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
      - bucket = "simple-demo-versioning-bucket" -> null
      - id     = "simple-demo-versioning-bucket" -> null

      - versioning_configuration {
          - status = "Enabled" -> null
        }
    }

  # aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule will be destroyed
  - resource "aws_s3_bucket_website_configuration" "simple-demo-website-with-routeing-rule" {
      - bucket           = "my-simple-demo-website-bucket" -> null
      - id               = "my-simple-demo-website-bucket" -> null
      - routing_rules    = jsonencode(
            [
              - {
                  - Condition = {
                      - KeyPrefixEquals = "docs/"
                    }
                  - Redirect  = {
                      - ReplaceKeyPrefixWith = "documents/"
                    }
                },
            ]
        ) -> null
      - website_domain   = "s3-website-us-east-1.amazonaws.com" -> null
      - website_endpoint = "my-simple-demo-website-bucket.s3-website-us-east-1.amazonaws.com" -> null

      - error_document {
          - key = "error.html" -> null
        }

      - index_document {
          - suffix = "index.html" -> null
        }

      - routing_rule {
          - condition {
              - key_prefix_equals = "docs/" -> null
            }

          - redirect {
              - replace_key_prefix_with = "documents/" -> null
            }
        }
    }

  # aws_sns_topic.order-created-topic will be destroyed
  - resource "aws_sns_topic" "order-created-topic" {
      - application_success_feedback_sample_rate = 0 -> null
      - arn                                      = "arn:aws:sns:us-east-1:000000000000:order-created-topic" -> null
      - content_based_deduplication              = false -> null
      - delivery_policy                          = jsonencode(
            {
              - http = {
                  - defaultHealthyRetryPolicy    = {
                      - backoffFunction    = "linear"
                      - maxDelayTarget     = 20
                      - minDelayTarget     = 20
                      - numMaxDelayRetries = 0
                      - numMinDelayRetries = 0
                      - numNoDelayRetries  = 0
                      - numRetries         = 3
                    }
                  - defaultThrottlePolicy        = {
                      - maxReceivesPerSecond = 1
                    }
                  - disableSubscriptionOverrides = false
                }
            }
        ) -> null
      - fifo_topic                               = false -> null
      - firehose_success_feedback_sample_rate    = 0 -> null
      - http_success_feedback_sample_rate        = 0 -> null
      - id                                       = "arn:aws:sns:us-east-1:000000000000:order-created-topic" -> null
      - lambda_success_feedback_sample_rate      = 0 -> null
      - name                                     = "order-created-topic" -> null
      - owner                                    = "000000000000" -> null
      - policy                                   = jsonencode(
            {
              - Id        = "__default_policy_ID"
              - Statement = [
                  - {
                      - Action    = [
                          - "SNS:GetTopicAttributes",
                          - "SNS:SetTopicAttributes",
                          - "SNS:AddPermission",
                          - "SNS:RemovePermission",
                          - "SNS:DeleteTopic",
                          - "SNS:Subscribe",
                          - "SNS:ListSubscriptionsByTopic",
                          - "SNS:Publish",
                          - "SNS:Receive",
                        ]
                      - Condition = {
                          - StringEquals = {
                              - "AWS:SourceOwner" = "000000000000"
                            }
                        }
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "*"
                        }
                      - Resource  = "arn:aws:sns:us-east-1:000000000000:order-created-topic"
                      - Sid       = "__default_statement_ID"
                    },
                ]
              - Version   = "2008-10-17"
            }
        ) -> null
      - sqs_success_feedback_sample_rate         = 0 -> null
      - tags                                     = {} -> null
      - tags_all                                 = {} -> null
    }

  # aws_sns_topic.simple-demo-topic will be destroyed
  - resource "aws_sns_topic" "simple-demo-topic" {
      - application_success_feedback_sample_rate = 0 -> null
      - arn                                      = "arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo" -> null
      - content_based_deduplication              = true -> null
      - fifo_topic                               = true -> null
      - firehose_success_feedback_sample_rate    = 0 -> null
      - http_success_feedback_sample_rate        = 0 -> null
      - id                                       = "arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo" -> null
      - lambda_success_feedback_sample_rate      = 0 -> null
      - name                                     = "simple-demo-topic.fifo" -> null
      - owner                                    = "000000000000" -> null
      - policy                                   = jsonencode(
            {
              - Id        = "__default_policy_ID"
              - Statement = [
                  - {
                      - Action    = [
                          - "SNS:GetTopicAttributes",
                          - "SNS:SetTopicAttributes",
                          - "SNS:AddPermission",
                          - "SNS:RemovePermission",
                          - "SNS:DeleteTopic",
                          - "SNS:Subscribe",
                          - "SNS:ListSubscriptionsByTopic",
                          - "SNS:Publish",
                          - "SNS:Receive",
                        ]
                      - Condition = {
                          - StringEquals = {
                              - "AWS:SourceOwner" = "000000000000"
                            }
                        }
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "*"
                        }
                      - Resource  = "arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo"
                      - Sid       = "__default_statement_ID"
                    },
                ]
              - Version   = "2008-10-17"
            }
        ) -> null
      - sqs_success_feedback_sample_rate         = 0 -> null
      - tags                                     = {} -> null
      - tags_all                                 = {} -> null
    }

  # aws_sqs_queue.simple-demo-queue-fifo will be destroyed
  - resource "aws_sqs_queue" "simple-demo-queue-fifo" {
      - arn                               = "arn:aws:sqs:us-east-1:000000000000:simple-demo-queue.fifo" -> null
      - content_based_deduplication       = true -> null
      - deduplication_scope               = "queue" -> null
      - delay_seconds                     = 0 -> null
      - fifo_queue                        = true -> null
      - fifo_throughput_limit             = "perQueue" -> null
      - id                                = "http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo" -> null
      - kms_data_key_reuse_period_seconds = 300 -> null
      - max_message_size                  = 262144 -> null
      - message_retention_seconds         = 345600 -> null
      - name                              = "simple-demo-queue.fifo" -> null
      - receive_wait_time_seconds         = 0 -> null
      - sqs_managed_sse_enabled           = false -> null
      - tags                              = {} -> null
      - tags_all                          = {} -> null
      - url                               = "http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo" -> null
      - visibility_timeout_seconds        = 30 -> null
    }

  # aws_sqs_queue.simple-demo-queue-high-throughput-fifo will be destroyed
  - resource "aws_sqs_queue" "simple-demo-queue-high-throughput-fifo" {
      - arn                               = "arn:aws:sqs:us-east-1:000000000000:simple-demo-queue-high-throughput.fifo" -> null
      - content_based_deduplication       = false -> null
      - deduplication_scope               = "messageGroup" -> null
      - delay_seconds                     = 0 -> null
      - fifo_queue                        = true -> null
      - fifo_throughput_limit             = "perMessageGroupId" -> null
      - id                                = "http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo" -> null
      - kms_data_key_reuse_period_seconds = 300 -> null
      - max_message_size                  = 262144 -> null
      - message_retention_seconds         = 345600 -> null
      - name                              = "simple-demo-queue-high-throughput.fifo" -> null
      - receive_wait_time_seconds         = 0 -> null
      - sqs_managed_sse_enabled           = false -> null
      - tags                              = {} -> null
      - tags_all                          = {} -> null
      - url                               = "http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo" -> null
      - visibility_timeout_seconds        = 30 -> null
    }

Plan: 0 to add, 0 to change, 21 to destroy.
aws_s3_bucket_logging.example: Destroying... [id=simple-demo-logging-bucket]
aws_s3_bucket_versioning.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket]
aws_s3_bucket_acl.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket,private]
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Destroying... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Destroying... [id=my-simple-demo-website-bucket]
aws_s3_bucket_acl.simple-demo-bucket_acl: Destroying... [id=my-simple-demo-bucket,private]
aws_sns_topic.order-created-topic: Destroying... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
aws_s3_bucket_cors_configuration.simple-demo-cors: Destroying... [id=simple-demo-cors-bucket]
aws_sns_topic.simple-demo-topic: Destroying... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
aws_dynamodb_table.simple-demo-dynamodb-table: Destroying... [id=GameScores]
aws_s3_bucket_acl.simple-demo-versioning: Destruction complete after 0s
aws_s3_bucket_acl.simple-demo-bucket_acl: Destruction complete after 0s
aws_sns_topic.order-created-topic: Destruction complete after 1s
aws_s3_bucket_versioning.simple-demo-versioning: Destruction complete after 1s
aws_s3_bucket_logging.example: Destruction complete after 1s
aws_sns_topic.simple-demo-topic: Destruction complete after 1s
aws_s3_bucket_acl.simple-demo-logging: Destroying... [id=simple-demo-logging-bucket,private]
aws_dynamodb_table.simple-demo-dynamodb-global-table: Destroying... [id=simple-demo-dynamodb-global-table]
aws_s3_bucket.test-bucket: Destroying... [id=my-bucket]
aws_sqs_queue.simple-demo-queue-fifo: Destroying... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
aws_s3_bucket_cors_configuration.simple-demo-cors: Destruction complete after 1s
aws_s3_bucket_acl.simple-demo-logging: Destruction complete after 0s
aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Destruction complete after 1s
aws_s3_bucket_acl.simple-demo-logging-target_acl: Destroying... [id=simple-demo-logging-target-bucket,log-delivery-write]
aws_s3_bucket.simple-demo-bucket: Destroying... [id=my-simple-demo-bucket]
aws_s3_bucket.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket]
aws_s3_bucket_acl.simple-demo-logging-target_acl: Destruction complete after 0s
aws_dynamodb_table.simple-demo-dynamodb-table: Destruction complete after 1s
aws_s3_bucket.test-bucket: Destruction complete after 0s
aws_s3_bucket.simple-demo-cors: Destroying... [id=simple-demo-cors-bucket]
aws_s3_bucket.simple-demo-logging: Destroying... [id=simple-demo-logging-bucket]
aws_s3_bucket.simple-demo-website: Destroying... [id=my-simple-demo-website-bucket]
aws_s3_bucket.simple-demo-versioning: Destruction complete after 0s
aws_s3_bucket.simple-demo-bucket: Destruction complete after 0s
aws_s3_bucket.simple-demo-logging-target: Destroying... [id=simple-demo-logging-target-bucket]
aws_s3_bucket.simple-demo-cors: Destruction complete after 0s
aws_s3_bucket.simple-demo-logging: Destruction complete after 0s
aws_s3_bucket.simple-demo-website: Destruction complete after 0s
aws_s3_bucket.simple-demo-logging-target: Destruction complete after 0s
aws_dynamodb_table.simple-demo-dynamodb-global-table: Destruction complete after 1s
aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Destruction complete after 2s
aws_sqs_queue.simple-demo-queue-fifo: Destruction complete after 1s

Destroy complete! Resources: 21 destroyed.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo>
```



## 7、检查资源是否已经销毁

```powershell
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 s3 ls
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sns list-topics
{
    "Topics": []
}
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sqs list-queues
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 dynamodb list-tables
{
    "TableNames": []
}

```

