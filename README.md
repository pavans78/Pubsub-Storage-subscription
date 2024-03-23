# Pubsub-Storage-subscription

Terraform for PubSub using the Cloud Storage Subscriptions.

Pub/Sub doesn't directly support subscriptions to Cloud Storage buckets. However, you can achieve a similar functionality using Cloud Storage subscriptions, which integrate Pub/Sub with Cloud Storage. The messages are sent as batches and stored in the Cloud Storage bucket. A single batch or file is stored as an object in the bucket. Here's how it works:

## Cloud Storage Subscriptions: ##

1. **Topic and Subscription:**   You create a Pub/Sub topic and a Cloud Storage subscription linked to that topic.

2. **Message Delivery:**   When you publish messages to the topic, Pub/Sub acts as an intermediary.

3. **Storage API Integration:**   Pub/Sub uses the Cloud Storage API to deliver the messages as objects to a designated Cloud Storage bucket specified in the subscription.

4. **Batching and Delivery:**   Messages are typically delivered in batches to optimize storage operations.


## Setting Up Cloud Storage Subscriptions:

- **Permissions:**  The Pub/Sub service account needs permissions to write to the Cloud Storage bucket and access bucket metadata. Grant these permissions at the bucket level or project level.
- **Subscription Creation:**  You can create Cloud Storage subscriptions using:
    - **Google Cloud Console:**  A user-friendly interface for managing subscriptions.
    - **Google Cloud CLI:**  The `gcloud` command-line tool offers commands for subscription management.
    - **Client Libraries:**  Google Cloud client libraries for various programming languages allow programmatic creation.
    - **Pub/Sub API:**  The Pub/Sub API provides programmatic access for subscription management.

## Benefits:

- **Decoupled Workflow:** Pub/Sub handles message delivery, decoupling publishers from directly interacting with Cloud Storage.
- **Scalability:** Cloud Storage subscriptions can handle large volumes of messages efficiently.

## Considerations:

- **Object Size and Batching:**  Configure the batch settings based on desired object size and delivery frequency within the subscription.
- **Error Handling:**  Cloud Storage subscriptions offer features like dead letter topics to manage delivery failures.


## Try it out

1. Initialize your new Terraform configuration by running the terraform init command in the same directory as your main.tf file:

    ```sh
    terraform init
    ```

1. To validate and format the terraform code:
   ```sh
   terraform validate
   terraform fmt
   ```

1. See the execution plan by running the terraform plan command with var-file, var-file is the inputs of the variables:

    ```sh
    terraform plan -var-file=var.tfvars 
    ```
    The output has a + next to resources blocks(google_bigquery_dataset & google_bigquery_table) , meaning that Terraform will create these resources. Beneath that, it shows the attributes that will be set. When the value displayed is (known after apply), it means that the value won't be known until the resource is created.

    If anything in the plan seems incorrect or dangerous, it is shows the error messages.

1. Apply you configuration now by running the command terraform apply:

    ```sh
    terraform apply -var-file=_var.tfvars --auto-approve
    ```

1. Clean up after you’re done:

    ```sh
    terraform destroy -var-file=_var.tfvars --auto-approve
    ```

----

For in-depth instructions and details, refer to the official documentation on Storage subscriptions:  [Link](https://cloud.google.com/pubsub/docs/create-cloudstorage-subscription)

This is not an official project and does not come with maintenance guarantees.
