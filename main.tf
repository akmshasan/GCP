# Start of Create Service Account -------------------------- #
module "terraform-iam-service-account" {
  source          = "./modules/iam"
  project_id      = var.project_id
  service_account = var.service_account
  display_name    = "Terraform Service Account for future resource provisioning"
}

module "iam-bindings" {
  source   = "./modules/iam-bindings"
  projects = [var.project_id]
  mode     = var.mode
  bindings = var.bindings
}
# End of Create Service Account -------------------------- #

# Start of Activate required APIs --------------------------------- #
resource "google_project_service" "service" {
  for_each = toset(var.activate_apis)
  project  = var.project_id
  service  = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = false
  disable_on_destroy         = false
}
# Note: Can use GCP "google_project_service" module
# End of Activate required APIs --------------------------------- #

# Start of Global Compute Metadata --------------------- #
module "compute-metadata" {
  source     = "./modules/compute_metadata"
  project_id = var.project_id
  metadata   = var.global_metadata
}

# End of Global Compute Metadata --------------------- #

