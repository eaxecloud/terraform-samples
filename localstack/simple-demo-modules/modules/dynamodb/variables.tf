variable "simple_demo_dynamodb_table_info" {
  description = "Settings of dynamodb table"
#  type = map(any)
  type = any
  default = {
    name           = "simple-demo-dynamodb-table"
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20
    stream_enabled = false
    stream_view_type = null
    hash_key       = "UserId"
    range_key      = "GameTitle"
    attributes     = [
      {
        name = "UserId"
        type = "S"
      },
      {
        name = "GameTitle"
        type = "S"
      },
      {
        name = "TopScore"
        type = "N"
      }
    ]
    ttl = {
      attribute_name = "TimeToExist"
      enabled        = false
    }
    global_secondary_index = {
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
}

# https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table/tree/v1.2.2
variable "simple_demo_dynamodb_table_attributes" {
  description = "Attributes of dynamodb table"
  type = list(map(string))
  default = [
    {
      name = "UserId"
      type = "S"
    },
    {
      name = "GameTitle"
      type = "S"
    },
    {
      name = "TopScore"
      type = "N"
    }
  ]
}

###参考
#https://learn.hashicorp.com/tutorials/terraform/for-each
#https://www.terraform.io/language/expressions/conditionals

## DynamoDB Global Table
variable "simple_demo_dynamodb_global_table_info" {
  description = "Settings of dynamodb global table"
  type = any
  default = {
    name             = "simple-demo-dynamodb-global-table"
    hash_key         = "TestTableHashKey"
    billing_mode     = "PAY_PER_REQUEST"
    stream_enabled   = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
    attributes = {
      "TestTableHashKey" = {
        name = "TestTableHashKey"
        type = "S"
      }
    }

    replicas = [
      {
        region_name = "us-east-2"
      },
      {
        region_name = "us-west-2"
      }
    ]
  }
}


