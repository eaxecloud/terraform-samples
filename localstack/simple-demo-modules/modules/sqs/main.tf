### SQS
# FIFO queue
resource "aws_sqs_queue" "simple-demo-queue-fifo" {
  name                        = var.simple_demo_queue_fifo_info.name
  fifo_queue                  = var.simple_demo_queue_fifo_info.fifo_queue
  content_based_deduplication = var.simple_demo_queue_fifo_info.content_based_deduplication
}

# High-throughput FIFO queue
resource "aws_sqs_queue" "simple-demo-queue-high-throughput-fifo" {
  name                  = var.simple_demo_queue_high_throughput_fifo_info.name
  fifo_queue            = var.simple_demo_queue_high_throughput_fifo_info.fifo_queue
  deduplication_scope   = var.simple_demo_queue_high_throughput_fifo_info.deduplication_scope
  fifo_throughput_limit = var.simple_demo_queue_high_throughput_fifo_info.fifo_throughput_limit
}
