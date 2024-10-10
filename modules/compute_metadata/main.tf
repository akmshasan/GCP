resource "google_compute_project_metadata" "default" {
  project     = var.project_id
  metadata = tomap({for key, value in var.metadata : key => value})
}