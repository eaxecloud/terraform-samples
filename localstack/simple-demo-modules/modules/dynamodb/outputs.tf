output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.simple-demo-dynamodb-table.arn
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.simple-demo-dynamodb-table.id
}

output "dynamodb_table_stream_arn" {
  description = "The ARN of the Table Stream. Only available when var.stream_enabled is true"
  value       = var.simple_demo_dynamodb_table_info.stream_enabled ? try(aws_dynamodb_table.simple-demo-dynamodb-table.stream_arn, "") : null
}

output "dynamodb_table_stream_label" {
  description = "A timestamp, in ISO 8601 format of the Table Stream. Only available when var.stream_enabled is true"
  value       = var.simple_demo_dynamodb_table_info.stream_enabled ? try(aws_dynamodb_table.simple-demo-dynamodb-table.stream_label, "") : null
}

output "dynamodb_global_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.simple-demo-dynamodb-global-table.arn
}

output "dynamodb_global_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.simple-demo-dynamodb-global-table.id
}

output "dynamodb_global_table_stream_arn" {
  description = "The ARN of the Table Stream. Only available when var.stream_enabled is true"
  value       = var.simple_demo_dynamodb_global_table_info.stream_enabled ? try(aws_dynamodb_table.simple-demo-dynamodb-global-table.stream_arn, "") : null
}

output "dynamodb_global_table_stream_label" {
  description = "A timestamp, in ISO 8601 format of the Table Stream. Only available when var.stream_enabled is true"
  value       = var.simple_demo_dynamodb_global_table_info.stream_enabled ? try(aws_dynamodb_table.simple-demo-dynamodb-global-table.stream_label, "") : null
}