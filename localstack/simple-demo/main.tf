# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.15.1"
#      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
#  access_key = "my-access-key"
#  secret_key = "my-secret-key"
  access_key                  = "test"
  secret_key                  = "test"
#  s3_force_path_style         = true   # Warning: Argument is deprecated
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
#    apigateway     = "http://192.168.146.179:4566"
#    cloudformation = "http://192.168.146.179:4566"
#    cloudwatch     = "http://192.168.146.179:4566"
    dynamodb       = "http://192.168.146.179:4566"
#    ec2            = "http://192.168.146.179:4566"
#    es             = "http://192.168.146.179:4566"
#    elasticache    = "http://192.168.146.179:4566"
#    firehose       = "http://192.168.146.179:4566"
#    iam            = "http://192.168.146.179:4566"
#    kinesis        = "http://192.168.146.179:4566"
#    lambda         = "http://192.168.146.179:4566"
#    rds            = "http://192.168.146.179:4566"
#    redshift       = "http://192.168.146.179:4566"
#    route53        = "http://192.168.146.179:4566"
    s3             = "http://192.168.146.179:4566"
#    secretsmanager = "http://192.168.146.179:4566"
#    ses            = "http://192.168.146.179:4566"
    sns            = "http://192.168.146.179:4566"
    sqs            = "http://192.168.146.179:4566"
#    ssm            = "http://192.168.146.179:4566"
#    stepfunctions  = "http://192.168.146.179:4566"
#    sts            = "http://192.168.146.179:4566"
  }
}

#<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
#  # Block body
#  <IDENTIFIER> = <EXPRESSION> # Argument
#}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

# With ACL
resource "aws_s3_bucket" "simple-demo-bucket" {
  bucket = "my-simple-demo-bucket"
}

resource "aws_s3_bucket_acl" "simple-demo-bucket_acl" {
  bucket = aws_s3_bucket.simple-demo-bucket.id
  acl    = "private"
}

# Website
resource "aws_s3_bucket" "simple-demo-website" {
  bucket = "my-simple-demo-website-bucket"
}
resource "aws_s3_bucket_website_configuration" "simple-demo-website-with-routeing-rule" {
  bucket = aws_s3_bucket.simple-demo-website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

# cors
resource "aws_s3_bucket" "simple-demo-cors" {
  bucket = "simple-demo-cors-bucket"
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
  bucket = "simple-demo-versioning-bucket"
}

resource "aws_s3_bucket_acl" "simple-demo-versioning" {
  bucket = aws_s3_bucket.simple-demo-versioning.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
  bucket = aws_s3_bucket.simple-demo-versioning.id
  versioning_configuration {
    status = "Enabled"
  }
}

# logging
resource "aws_s3_bucket" "simple-demo-logging" {
  bucket = "simple-demo-logging-bucket"
}

resource "aws_s3_bucket_acl" "simple-demo-logging" {
  bucket = aws_s3_bucket.simple-demo-logging.id
  acl    = "private"
}

resource "aws_s3_bucket" "simple-demo-logging-target" {
  bucket = "simple-demo-logging-target-bucket"
}

resource "aws_s3_bucket_acl" "simple-demo-logging-target_acl" {
  bucket = aws_s3_bucket.simple-demo-logging-target.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.simple-demo-logging.id

  target_bucket = aws_s3_bucket.simple-demo-logging-target.id
  target_prefix = "log/"
}

### SNS
resource "aws_sns_topic" "simple-demo-topic" {
  name                        = "simple-demo-topic.fifo"
  fifo_topic                  = true
  content_based_deduplication = true
}

resource "aws_sns_topic" "order-created-topic" {
  name            = "order-created-topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

### SQS
# FIFO queue
resource "aws_sqs_queue" "simple-demo-queue-fifo" {
  name                        = "simple-demo-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

# High-throughput FIFO queue
resource "aws_sqs_queue" "simple-demo-queue-high-throughput-fifo" {
  name                  = "simple-demo-queue-high-throughput.fifo"
  fifo_queue            = true
  deduplication_scope   = "messageGroup"
  fifo_throughput_limit = "perMessageGroupId"
}

# SQS with policy
### Dead-letter queue have bug: https://github.com/hashicorp/terraform-provider-aws/issues/22577
#resource "aws_sqs_queue" "simple-demo-dead-letter-queue" {
#  name                        = "simple-demo-dead-letter-queue"
#  fifo_queue                  = true
#  content_based_deduplication = true
#}

#resource "aws_sqs_queue" "simple-demo-queue-with-policy" {
#  name                      = "simple-demo-queue-with-policy"
#  delay_seconds             = 90
#  max_message_size          = 2048
#  message_retention_seconds = 86400
#  receive_wait_time_seconds = 10
#  redrive_policy = jsonencode({
#    deadLetterTargetArn = aws_sqs_queue.simple-demo-dead-letter-queue.arn
#    maxReceiveCount     = 4
#  })
#  redrive_allow_policy = jsonencode({
#    redrivePermission = "byQueue",
#    sourceQueueArns   = [aws_sqs_queue.simple-demo-dead-letter-queue.arn]
#  })
#
#  tags = {
#    Environment = "production"
#  }
#}

### DynamoDB Table
resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "simple-demo-dynamodb-table"
    Environment = "production"
  }
}

# DynamoDB Global Table
resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
  name             = "simple-demo-dynamodb-global-table"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }

  replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  }
}
