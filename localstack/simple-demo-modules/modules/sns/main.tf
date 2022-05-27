### SNS
resource "aws_sns_topic" "simple-demo-topic" {
  name                        = var.simple_demo_topic_info.name
  fifo_topic                  = var.simple_demo_topic_info.fifo_topic
  content_based_deduplication = var.simple_demo_topic_info.content_based_deduplication
}

resource "aws_sns_topic" "order-created-topic" {
  name            = var.order_created_topic_info.name
  delivery_policy = var.order_created_topic_info.delivery_policy
}