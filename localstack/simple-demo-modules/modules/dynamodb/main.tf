### DynamoDB Table
resource "aws_dynamodb_table" "simple-demo-dynamodb-table" {
  name           = var.simple_demo_dynamodb_table_info.name
  billing_mode   = var.simple_demo_dynamodb_table_info.billing_mode
  read_capacity  = var.simple_demo_dynamodb_table_info.read_capacity
  write_capacity = var.simple_demo_dynamodb_table_info.write_capacity
  hash_key       = var.simple_demo_dynamodb_table_info.hash_key
  range_key      = var.simple_demo_dynamodb_table_info.range_key
  stream_enabled   = var.simple_demo_dynamodb_table_info.stream_enabled
  stream_view_type = var.simple_demo_dynamodb_table_info.stream_view_type

  dynamic "attribute" {
#    for_each = var.simple_demo_dynamodb_table_attributes
    for_each = var.simple_demo_dynamodb_table_info.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
#  attribute {
#    name = var.simple_demo_dynamodb_table_info.attributes["UserId"]["name"]
#    type = var.simple_demo_dynamodb_table_info.attributes["UserId"]["type"]
#  }
#
#  attribute {
#    name = var.simple_demo_dynamodb_table_info.attributes["GameTitle"]["name"]
#    type = var.simple_demo_dynamodb_table_info.attributes["GameTitle"]["type"]
#  }
#
#  attribute {
#    name = var.simple_demo_dynamodb_table_info.attributes["TopScore"]["name"]
#    type = var.simple_demo_dynamodb_table_info.attributes["TopScore"]["type"]
#  }

  ttl {
    attribute_name = var.simple_demo_dynamodb_table_info.ttl.attribute_name
    enabled        = var.simple_demo_dynamodb_table_info.ttl.enabled
  }

  global_secondary_index {
    name               = var.simple_demo_dynamodb_table_info.global_secondary_index.name
    hash_key           = var.simple_demo_dynamodb_table_info.global_secondary_index.hash_key
    range_key          = var.simple_demo_dynamodb_table_info.global_secondary_index.range_key
    write_capacity     = var.simple_demo_dynamodb_table_info.global_secondary_index.write_capacity
    read_capacity      = var.simple_demo_dynamodb_table_info.global_secondary_index.read_capacity
    projection_type    = var.simple_demo_dynamodb_table_info.global_secondary_index.projection_type
    non_key_attributes = var.simple_demo_dynamodb_table_info.global_secondary_index.non_key_attributes
  }

  tags = {
    Name        = var.simple_demo_dynamodb_table_info.tags.Name
    Environment = var.simple_demo_dynamodb_table_info.tags.Environment
  }
}

# DynamoDB Global Table
resource "aws_dynamodb_table" "simple-demo-dynamodb-global-table" {
  name             = var.simple_demo_dynamodb_global_table_info.name
  hash_key         = var.simple_demo_dynamodb_global_table_info.hash_key
  billing_mode     = var.simple_demo_dynamodb_global_table_info.billing_mode
  stream_enabled   = var.simple_demo_dynamodb_global_table_info.stream_enabled
  stream_view_type = var.simple_demo_dynamodb_global_table_info.stream_view_type

  dynamic "attribute" {
    for_each = var.simple_demo_dynamodb_global_table_info.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
#  attribute {
#    name = var.simple_demo_dynamodb_global_table_info.attributes["TestTableHashKey"]["name"]
#    type = var.simple_demo_dynamodb_global_table_info.attributes["TestTableHashKey"]["type"]
#  }

  dynamic "replica" {
    for_each = var.simple_demo_dynamodb_global_table_info.replicas
    content {
      region_name = replica.value.region_name
    }
  }
#  replica {
#    region_name = var.simple_demo_dynamodb_global_table_info.replicas["us-east-2"]["region_name"]
#  }
#
#  replica {
#    region_name = var.simple_demo_dynamodb_global_table_info.replicas["us-west-2"]["region_name"]
#  }
}
