########## COMMON INPUTS ############
main = {
  project = "my-first-project"
  region  = "us-central1"
  env     = "dev"
}

### Pubsub  ###

pubsub_topic = {
  topic_name = "storage-topic"
}

### Pubsub for Dead letter ###

pubsub_topic_dl = {
  topic_name = "bq-topic-dl"
}

### Cloud Storage bucket ###

storage = {
 pubsub = {
    name = "pubsub-uniqueid"
    location = "us"
    uniform_bucket_level_access = true
   }

 pubsub_dl = {
    name = "pubsub-dl-uniqueid"
    location = "us"
    uniform_bucket_level_access = true
   }

}