module "wazuh-pubsub" {
  source = "./modules/pubsub"
  project_id = var.project_id
  topic = "GKE_Topic"
  topic_labels = {
    environment = "prod"
    app_type = "pubsub"
    application = "wazuh"
  }
  grant_token_creator = false
  pull_subscriptions = [
    {
      name                         = "GKE_Subscription"
      ack_deadline_seconds         = 10
      enable_exactly_once_delivery = true
      message_retention_duration = "604800s"
    },
  ]
  subscription_labels = {
    environment = "prod"
    app_type = "pubsub"
    application = "wazuh"
  }
}

module "wazuh-pubsub-sink" {
  source                 = "./modules/log-export"
  destination_uri        = "pubsub.googleapis.com/projects/learning-0165559734/topics/GKE_Topic"
#  filter                 = "severity >= ERROR"
  filter = <<-EOT
    LOG_ID("linux-auditd")
    resource.labels.cluster_name = "mudah-cluster-prod"
    resource.labels.location = "asia-southeast1"
  EOT
  log_sink_name          = "GKE_Sink"
  parent_resource_id     = var.project_id
  parent_resource_type   = "project"
  unique_writer_identity = true
}

