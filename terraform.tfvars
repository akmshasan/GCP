project_id   = "learning-0165559734"
project_name = "learning"
region       = "asia-southeast1"
zone         = "asia-southeast1-a"
zones        = ["asia-southeast1-a"]

# API Activation ----------------- #
activate_apis = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "iam.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "dns.googleapis.com",
  "cloudkms.googleapis.com",
  "pubsub.googleapis.com",
  "serviceusage.googleapis.com",
  "cloudbilling.googleapis.com",
  "sql-component.googleapis.com",
  "artifactregistry.googleapis.com",
  "bigquery.googleapis.com",
  "bigqueryconnection.googleapis.com",
]

# Service Account ----------------- #
service_account = [
  "terraform-sa"
]
mode = "additive"
bindings = {
  "roles/compute.admin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/compute.networkAdmin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  #  "roles/logging.admin" = [
  #    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  #  ]
  "roles/resourcemanager.projectIamAdmin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/storage.objectAdmin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/storage.admin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/container.admin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/container.clusterAdmin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/container.nodeServiceAccount" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/container.hostServiceAgentUser" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/logging.logWriter" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/monitoring.metricWriter" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/monitoring.viewer" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/stackdriver.resourceMetadata.writer" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/compute.instanceAdmin.v1" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
  "roles/pubsub.admin" = [
    "serviceAccount:terraform-sa@learning-0165559734.iam.gserviceaccount.com",
  ]
}

# Global Metadata
global_metadata = {
  "enable-oslogin"     = "TRUE"
  "serial-port-enable" = 1
}

# VPC
learning-vpc = {
  name                                      = "learning-vpc"
  auto_create_subnetworks                   = false
  delete_default_routes_on_create           = true
  mtu                                       = 1460
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  routing_mode                              = "REGIONAL"
}

# Subnets
learning-vpc-subnets = {
  subnets = [
    {
      subnet_name           = "public-subnet-1",
      subnet_ip             = "10.9.64.0/22",
      subnet_region         = "asia-southeast1",
      subnet_private_access = "true",
      subnet_flow_logs      = "false",
      description           = "public-subnet-1",
    },
    {
      subnet_name           = "private-subnet-1",
      subnet_ip             = "10.0.76.0/22",
      subnet_region         = "asia-southeast1",
      subnet_private_access = "true",
      subnet_flow_logs      = "false",
      description           = "private-subnet-1",
    }
  ]
  secondary_ranges = {
    public-subnet-1 = [
      {
        range_name    = "pod-subnet-public"
        ip_cidr_range = "10.99.144.0/20"
      },
      {
        range_name    = "service-subnet-public"
        ip_cidr_range = "10.99.136.0/22"
      }
    ],
    private-subnet-1 = [
      {
        range_name    = "pod-subnet-private"
        ip_cidr_range = "10.97.224.0/20"
      },
      {
        range_name    = "service-subnet-private"
        ip_cidr_range = "10.97.220.0/22"
      }
    ]
  }

}



