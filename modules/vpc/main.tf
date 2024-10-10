resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes_on_create
  mtu                     = var.mtu
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
  routing_mode = var.routing_mode
}

