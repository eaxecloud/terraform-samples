# 简要描述

这个模块演示了如何使用terraform在localstack上创建资源。因为主要是为了演示用法，因此只创建了很少的资源类型，S3，SNS，SQS和DynamoDB Table。

# 运行环境介绍

此模块的运行环境是：localstack运行在一台VM（CentOS）上，terraform运行在另外一台电脑上（Win10）

## Localstack

以docker方式启动（以docker-compose方式启动会更方便）

### 启动命令

```shell
docker run -ti --rm --name my-localstack -d -p 4566:4566 -p 4510-4559:4510-4559 -e DEBUG=1 -e "LOCALSTACK_SERVICES=s3,sqs,sns,dynamodb" -e HOSTNAME_EXTERNAL=192.168.146.179 localstack/localstack
```

其中192.168.146.179就是运行Localstack的CentOS的的IP地址。

### 状态检查

```shell
[frank@devops-localstack ~]$ localstack --version
0.14.2.11
[frank@devops-localstack ~]$ localstack status services
┏━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━┓
┃ Service                  ┃ Status      ┃
┡━━━━━━━━━━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━┩
│ acm                      │ ✔ available │
│ apigateway               │ ✔ available │
│ cloudformation           │ ✔ available │
│ cloudwatch               │ ✔ available │
│ config                   │ ✔ available │
│ dynamodb                 │ ✔ running   │
│ dynamodbstreams          │ ✔ available │
│ ec2                      │ disabled    │
│ es                       │ ✔ available │
│ events                   │ ✔ available │
│ firehose                 │ ✔ available │
│ iam                      │ ✔ available │
│ kinesis                  │ ✔ running   │
│ kms                      │ ✔ available │
│ lambda                   │ ✔ available │
│ logs                     │ ✔ available │
│ opensearch               │ ✔ available │
│ redshift                 │ ✔ available │
│ resource-groups          │ ✔ available │
│ resourcegroupstaggingapi │ ✔ available │
│ route53                  │ ✔ available │
│ route53resolver          │ ✔ available │
│ s3                       │ ✔ running   │
│ s3control                │ ✔ available │
│ secretsmanager           │ ✔ available │
│ ses                      │ ✔ available │
│ sns                      │ ✔ running   │
│ sqs                      │ ✔ running   │
│ ssm                      │ ✔ available │
│ stepfunctions            │ ✔ available │
│ sts                      │ ✔ available │
│ support                  │ ✔ available │
│ swf                      │ ✔ available │
└──────────────────────────┴─────────────┘

```

## Terraform

### 版本信息

```powershell
>terraform version
Terraform v1.2.0
on windows_amd64
+ provider registry.terraform.io/hashicorp/aws v4.15.1

Your version of Terraform is out of date! The latest version
is 1.2.1. You can update by downloading from https://www.terraform.io/downloads.html
```



# 如何运行？

首先要确保Localstack是启动的，而且S3，SNS，SQS，和DynamoDB 的service是启动的。另外要确保运行terraform的电脑与运行Localstack的服务器是网络联通的，是可以正常访问的。

## 1、首先进入工作目录

比如：

```powershell
C:\Users\Frank>cd D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules

C:\Users\Frank>d:

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>
```

## 2、执行terraform init

> 此命令只需要执行一次，如果已经执行过了，不必多次再次执行
>
> 另外，第一次执行和以后执行命令的输出略有不同。

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>terraform init
Initializing modules...

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

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>
```

## 3、执行terraform plan

> 每次执行的输出略有不同

```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>terraform plan
module.sns.aws_sns_topic.order-created-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
module.sns.aws_sns_topic.simple-demo-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table: Refreshing state... [id=simple-demo-dynamodb-global-table]
module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
module.s3.aws_s3_bucket.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket.simple-demo-website: Refreshing state... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket.simple-demo-bucket: Refreshing state... [id=my-simple-demo-bucket]
module.s3.aws_s3_bucket.test-bucket: Refreshing state... [id=my-bucket]
module.s3.aws_s3_bucket.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
module.s3.aws_s3_bucket.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.sqs.aws_sqs_queue.simple-demo-queue-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Refreshing state... [id=simple-demo-dynamodb-table]
module.s3.aws_s3_bucket.simple-demo-logging-target: Refreshing state... [id=simple-demo-logging-target-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl: Refreshing state... [id=my-simple-demo-bucket,private]
module.s3.aws_s3_bucket_versioning.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket,private]
module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl: Refreshing state... [id=simple-demo-logging-target-bucket,log-delivery-write]
module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
module.s3.aws_s3_bucket_logging.example: Refreshing state... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket,private]
module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Refreshing state... [id=my-simple-demo-website-bucket]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table will be updated in-place
  ~ resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
        id             = "simple-demo-dynamodb-table"
        name           = "simple-demo-dynamodb-table"
        tags           = {
            "Environment" = "production"
            "Name"        = "simple-demo-dynamodb-table"
        }
        # (8 unchanged attributes hidden)




      ~ ttl {
          + attribute_name = "TimeToExist"
            # (1 unchanged attribute hidden)
        }
        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>
```

## 4、执行terraform apply --auto-approve

> 如果不加--auto-approve参数，会有确认提示，输入yes后执行apply动作，否则会取消操作。

```shell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>terraform apply --auto-approve
module.sns.aws_sns_topic.simple-demo-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
module.sqs.aws_sqs_queue.simple-demo-queue-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
module.sns.aws_sns_topic.order-created-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
module.s3.aws_s3_bucket.simple-demo-bucket: Refreshing state... [id=my-simple-demo-bucket]
module.s3.aws_s3_bucket.test-bucket: Refreshing state... [id=my-bucket]
module.s3.aws_s3_bucket.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table: Refreshing state... [id=simple-demo-dynamodb-global-table]
module.s3.aws_s3_bucket.simple-demo-logging-target: Refreshing state... [id=simple-demo-logging-target-bucket]
module.s3.aws_s3_bucket.simple-demo-website: Refreshing state... [id=my-simple-demo-website-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Refreshing state... [id=simple-demo-dynamodb-table]
module.s3.aws_s3_bucket.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
module.s3.aws_s3_bucket.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket_versioning.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket,private]
module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl: Refreshing state... [id=simple-demo-logging-target-bucket,log-delivery-write]
module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl: Refreshing state... [id=my-simple-demo-bucket,private]
module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Refreshing state... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket_logging.example: Refreshing state... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket,private]
module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table will be updated in-place
  ~ resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
        id             = "simple-demo-dynamodb-table"
        name           = "simple-demo-dynamodb-table"
        tags           = {
            "Environment" = "production"
            "Name"        = "simple-demo-dynamodb-table"
        }
        # (8 unchanged attributes hidden)




      ~ ttl {
          + attribute_name = "TimeToExist"
            # (1 unchanged attribute hidden)
        }
        # (5 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Modifying... [id=simple-demo-dynamodb-table]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Modifications complete after 0s [id=simple-demo-dynamodb-table]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>
```

## 5、检查资源是否创建成功

> 远程ssh登录到localstack服务器上执行。

```
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 s3 ls
2022-05-27 15:31:37 simple-demo-versioning-bucket
2022-05-27 15:31:37 simple-demo-logging-target-bucket
2022-05-27 15:31:37 simple-demo-cors-bucket
2022-05-27 15:31:37 simple-demo-logging-bucket
2022-05-27 15:31:37 my-bucket
2022-05-27 15:31:37 my-simple-demo-website-bucket
2022-05-27 15:31:38 my-simple-demo-bucket
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
        "simple-demo-dynamodb-global-table",
        "simple-demo-dynamodb-table"
    ]
}

```

以上输出说明所有资源创建成功

## 6、销毁资源，执行terraform destroy



```powershell
D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>terraform destroy --auto-approve
module.sns.aws_sns_topic.simple-demo-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
module.sqs.aws_sqs_queue.simple-demo-queue-fifo: Refreshing state... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
module.s3.aws_s3_bucket.simple-demo-website: Refreshing state... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket.simple-demo-bucket: Refreshing state... [id=my-simple-demo-bucket]
module.s3.aws_s3_bucket.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table: Refreshing state... [id=simple-demo-dynamodb-global-table]
module.s3.aws_s3_bucket.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.s3.aws_s3_bucket.simple-demo-logging-target: Refreshing state... [id=simple-demo-logging-target-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Refreshing state... [id=simple-demo-dynamodb-table]
module.sns.aws_sns_topic.order-created-topic: Refreshing state... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
module.s3.aws_s3_bucket.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]
module.s3.aws_s3_bucket.test-bucket: Refreshing state... [id=my-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging: Refreshing state... [id=simple-demo-logging-bucket,private]
module.s3.aws_s3_bucket_logging.example: Refreshing state... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl: Refreshing state... [id=simple-demo-logging-target-bucket,log-delivery-write]
module.s3.aws_s3_bucket_versioning.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-versioning: Refreshing state... [id=simple-demo-versioning-bucket,private]
module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl: Refreshing state... [id=my-simple-demo-bucket,private]
module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Refreshing state... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors: Refreshing state... [id=simple-demo-cors-bucket]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table will be destroyed
  - resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
      - arn              = "arn:aws:dynamodb:us-east-1:000000000000:table/simple-demo-dynamodb-global-table" -> null
      - billing_mode     = "PAY_PER_REQUEST" -> null
      - hash_key         = "TestTableHashKey" -> null
      - id               = "simple-demo-dynamodb-global-table" -> null
      - name             = "simple-demo-dynamodb-global-table" -> null
      - read_capacity    = 0 -> null
      - stream_arn       = "arn:aws:dynamodb:us-east-1:000000000000:table/simple-demo-dynamodb-global-table/stream/2022-05-27T07:31:38.425" -> null
      - stream_enabled   = true -> null
      - stream_label     = "2022-05-27T07:31:38.425" -> null
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

  # module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table will be destroyed
  - resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
      - arn            = "arn:aws:dynamodb:us-east-1:000000000000:table/simple-demo-dynamodb-table" -> null
      - billing_mode   = "PROVISIONED" -> null
      - hash_key       = "UserId" -> null
      - id             = "simple-demo-dynamodb-table" -> null
      - name           = "simple-demo-dynamodb-table" -> null
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

  # module.s3.aws_s3_bucket.simple-demo-bucket will be destroyed
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

  # module.s3.aws_s3_bucket.simple-demo-cors will be destroyed
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

  # module.s3.aws_s3_bucket.simple-demo-logging will be destroyed
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

  # module.s3.aws_s3_bucket.simple-demo-logging-target will be destroyed
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

  # module.s3.aws_s3_bucket.simple-demo-versioning will be destroyed
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

  # module.s3.aws_s3_bucket.simple-demo-website will be destroyed
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

  # module.s3.aws_s3_bucket.test-bucket will be destroyed
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

  # module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl will be destroyed
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

  # module.s3.aws_s3_bucket_acl.simple-demo-logging will be destroyed
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

  # module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl will be destroyed
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

  # module.s3.aws_s3_bucket_acl.simple-demo-versioning will be destroyed
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

  # module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors will be destroyed
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

  # module.s3.aws_s3_bucket_logging.example will be destroyed
  - resource "aws_s3_bucket_logging" "example" {
      - bucket        = "simple-demo-logging-bucket" -> null
      - id            = "simple-demo-logging-bucket" -> null
      - target_bucket = "simple-demo-logging-target-bucket" -> null
      - target_prefix = "log/" -> null
    }

  # module.s3.aws_s3_bucket_versioning.simple-demo-versioning will be destroyed
  - resource "aws_s3_bucket_versioning" "simple-demo-versioning" {
      - bucket = "simple-demo-versioning-bucket" -> null
      - id     = "simple-demo-versioning-bucket" -> null

      - versioning_configuration {
          - status = "Enabled" -> null
        }
    }

  # module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule will be destroyed
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

  # module.sns.aws_sns_topic.order-created-topic will be destroyed
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

  # module.sns.aws_sns_topic.simple-demo-topic will be destroyed
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

  # module.sqs.aws_sqs_queue.simple-demo-queue-fifo will be destroyed
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

  # module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo will be destroyed
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
module.s3.aws_s3_bucket_logging.example: Destroying... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket_versioning.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket]
module.sqs.aws_sqs_queue.simple-demo-queue-fifo: Destroying... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue.fifo]
module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Destroying... [id=http://192.168.146.179:4566/000000000000/simple-demo-queue-high-throughput.fifo]
module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl: Destroying... [id=my-simple-demo-bucket,private]
module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Destroying... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging: Destroying... [id=simple-demo-logging-bucket,private]
module.sns.aws_sns_topic.simple-demo-topic: Destroying... [id=arn:aws:sns:us-east-1:000000000000:simple-demo-topic.fifo]
module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors: Destroying... [id=simple-demo-cors-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table: Destroying... [id=simple-demo-dynamodb-global-table]
module.s3.aws_s3_bucket_acl.simple-demo-bucket_acl: Destruction complete after 0s
module.s3.aws_s3_bucket_acl.simple-demo-logging: Destruction complete after 0s
module.s3.aws_s3_bucket_logging.example: Destruction complete after 0s
module.s3.aws_s3_bucket_versioning.simple-demo-versioning: Destruction complete after 0s
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Destroying... [id=simple-demo-dynamodb-table]
module.sns.aws_sns_topic.simple-demo-topic: Destruction complete after 0s
module.s3.aws_s3_bucket.test-bucket: Destroying... [id=my-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket,private]
module.s3.aws_s3_bucket_cors_configuration.simple-demo-cors: Destruction complete after 0s
module.s3.aws_s3_bucket_acl.simple-demo-versioning: Destruction complete after 0s
module.s3.aws_s3_bucket_website_configuration.simple-demo-website-with-routeing-rule: Destruction complete after 0s
module.sns.aws_sns_topic.order-created-topic: Destroying... [id=arn:aws:sns:us-east-1:000000000000:order-created-topic]
module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl: Destroying... [id=simple-demo-logging-target-bucket,log-delivery-write]
module.s3.aws_s3_bucket.simple-demo-bucket: Destroying... [id=my-simple-demo-bucket]
module.s3.aws_s3_bucket_acl.simple-demo-logging-target_acl: Destruction complete after 0s
module.sns.aws_sns_topic.order-created-topic: Destruction complete after 0s
module.s3.aws_s3_bucket.test-bucket: Destruction complete after 0s
module.s3.aws_s3_bucket.simple-demo-logging: Destroying... [id=simple-demo-logging-bucket]
module.s3.aws_s3_bucket.simple-demo-cors: Destroying... [id=simple-demo-cors-bucket]
module.s3.aws_s3_bucket.simple-demo-versioning: Destroying... [id=simple-demo-versioning-bucket]
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-table: Destruction complete after 0s
module.s3.aws_s3_bucket.simple-demo-bucket: Destruction complete after 0s
module.s3.aws_s3_bucket.simple-demo-website: Destroying... [id=my-simple-demo-website-bucket]
module.s3.aws_s3_bucket.simple-demo-logging-target: Destroying... [id=simple-demo-logging-target-bucket]
module.s3.aws_s3_bucket.simple-demo-logging: Destruction complete after 1s
module.s3.aws_s3_bucket.simple-demo-cors: Destruction complete after 1s
module.s3.aws_s3_bucket.simple-demo-website: Destruction complete after 1s
module.s3.aws_s3_bucket.simple-demo-versioning: Destruction complete after 1s
module.s3.aws_s3_bucket.simple-demo-logging-target: Destruction complete after 1s
module.dynamodb.aws_dynamodb_table.simple-demo-dynamodb-global-table: Destruction complete after 2s
module.sqs.aws_sqs_queue.simple-demo-queue-fifo: Destruction complete after 2s
module.sqs.aws_sqs_queue.simple-demo-queue-high-throughput-fifo: Destruction complete after 2s

Destroy complete! Resources: 21 destroyed.

D:\workspace\exercises\python\terraform-samples\localstack\simple-demo-modules>
```

## 7、检查确认资源是否已经销毁

> 远程ssh登录到localstack服务器上执行。

```shell
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 s3 ls
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sns list-topics
{
    "Topics": []
}
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 sqs list-queues
{
    "QueueUrls": []
}
[frank@devops-localstack ~]$ aws --endpoint-url=http://192.168.146.179:4566 dynamodb list-tables
{
    "TableNames": []
}

```



至此测试完成。