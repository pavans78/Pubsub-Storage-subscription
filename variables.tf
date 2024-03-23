# common variables #
variable "main" {
  type = object({
    project = string
    region  = string
    env     = string
  })
}

# variable for storage
variable "storage" {
  type = map(object({
    name                        = string
    location                    = string
    uniform_bucket_level_access = string
  }))
}

# variable for Pub Sub topic #
variable "pubsub_topic" {
  type = object({
    topic_name = string
  })
}

# variable for Pub Sub topic dead letter #
variable "pubsub_topic_dl" {
  type = object({
    topic_name = string
  })
}
