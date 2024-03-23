resource "google_pubsub_topic" "default" {
  name = "topic-${var.pubsub_topic.topic_name}"

  labels = {
    env = var.main.env
  }

}


resource "google_pubsub_subscription" "subcription" {
  name  = "sub-${google_pubsub_topic.default.name}"
  topic = google_pubsub_topic.default.id

  cloud_storage_config {
    bucket = google_storage_bucket.storage.name

    filename_prefix = "pre-"
    filename_suffix = "-%{random_suffix}"

    max_bytes = 1000
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
  
  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.topic_deadletter.id
    max_delivery_attempts = 5
  }

  enable_message_ordering = false

  depends_on = [
    google_pubsub_topic.default, google_storage_bucket.storage
  ]
}

data "google_project" "project" {

}

resource "google_project_iam_member" "admin" {
  project = var.main.project
  role   = "roles/storage.admin"
  member = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}
