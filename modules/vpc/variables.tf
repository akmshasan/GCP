variable "project_id" {
  description = "The ID of the Project"
  type = string
  default = ""
}

variable "name" {
  description = "The name of the VPC"
  type = string
}

variable "auto_create_subnetworks" {
  description = "the network is created in custom subnet mode or auto_subnet_mode"
  type = bool
  default = false
}

variable "delete_default_routes_on_create" {
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation"
  type = bool
  default = true
}

variable "mtu" {
  description = "Maximum Transmission Unit in bytes. Default - 1460"
  type = number
  default = 1460
}

variable "network_firewall_policy_enforcement_order" {
  description = "Set the order that Firewall Rules and Firewall Policies are evaluated - BEFORE_CLASSIC_FIREWALL or AFTER_CLASSIC_FIREWALL"
  default = "AFTER_CLASSIC_FIREWALL"
}

variable "routing_mode" {
  description = "The network-wide routing mode to use - REGIONAL or GLOBAL"
  default = "GLOBAL"
}

