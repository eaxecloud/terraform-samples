variable "simple_demo_queue_fifo_info" {
  type = object({
    name = string
    fifo_queue    = bool
    content_based_deduplication = bool
  })
  default = {
    name = "simple-demo-queue.fifo"
    fifo_queue    = true
    content_based_deduplication = true
  }
  sensitive = false
  nullable = false
}

variable "simple_demo_queue_high_throughput_fifo_info" {
  type = object({
    name = string
    fifo_queue    = bool
    deduplication_scope   = string
    fifo_throughput_limit = string
  })
  default = {
    name                  = "simple-demo-queue-high-throughput.fifo"
    fifo_queue            = true
    deduplication_scope   = "messageGroup"
    fifo_throughput_limit = "perMessageGroupId"
  }
  sensitive = false
  nullable = false
}

