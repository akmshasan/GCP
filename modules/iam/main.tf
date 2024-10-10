# Project IAM Service Account Creation
resource "google_service_account" "service_account" {
  for_each   = toset(var.service_account)
  account_id = each.value
  project = var.project_id
  display_name = var.display_name
}