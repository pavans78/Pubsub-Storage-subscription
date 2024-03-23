resource "google_pubsub_topic" "dead_letter_topic" {
  name = "topic-${var.pubsub_topic_dl.topic_name}"

  labels = {
    env = var.main.env
  }

}


resource "google_pubsub_subscription" "subcription_dl" {
  name  = "sub-${google_pubsub_topic.dead_letter_topic.name}"
  topic = google_pubsub_topic.dead_letter_topic.id

  cloud_storage_config {
    bucket = google_storage_bucket.storage_dl.name

    filename_prefix = "pre-"
    filename_suffix = "-dl"

    max_bytes    = 1000
    max_duration = "300s"
  }
  labels = {
    env = var.main.env
  }

  message_retention_duration = "604800s"
  retain_acked_messages      = false

  ack_deadline_seconds = 60

  expiration_policy {
    ttl = "604800.5s"
  }

  enable_message_ordering = false

  depends_on = [
    google_pubsub_topic.dead_letter_topic, google_storage_bucket.storage_dl
  ]
}
