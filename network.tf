# Learning VPC
module "learning-vpc" {
  source                                    = "./modules/vpc"
  name                                      = var.learning-vpc.name
  project_id                                = var.project_id
  auto_create_subnetworks                   = var.learning-vpc.auto_create_subnetworks
  delete_default_routes_on_create           = var.learning-vpc.delete_default_routes_on_create
  mtu                                       = var.learning-vpc.mtu
  network_firewall_policy_enforcement_order = var.learning-vpc.network_firewall_policy_enforcement_order
  routing_mode                              = var.learning-vpc.routing_mode

}

# Learning VPC - Subnets
module "learning-vpc-subnets" {
  source           = "./modules/subnets"
  network_name     = var.learning-vpc.name
  project_id       = var.project_id
  subnets          = var.learning-vpc-subnets.subnets
  secondary_ranges = var.learning-vpc-subnets.secondary_ranges

  depends_on = [
    module.learning-vpc
  ]
}

# Learning VPC - CloudNAT
