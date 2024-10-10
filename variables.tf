variable "project_id" {
  description = "The ID of the Project"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
  default     = ""
}

variable "region" {
  description = "Default Region of the Project"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Default Zone of the Project"
  type        = string
  default     = ""
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = [""]
}

variable "service_account" {
  type        = list(string)
  description = "Name of the service account to be created"
  default     = [""]
}

variable "mode" {
  description = "Mode for adding the IAM policies/bindings, additive and authoritative"
  type        = string
  default     = "additive"
}

variable "bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
  default     = {}
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = [""]
}

variable "global_metadata" {
  type        = map(string)
  description = "Metadata, provided as a map"
  default     = {}
}

# VPC
variable "learning-vpc" {
  type = object({
    name                                      = string
    auto_create_subnetworks                   = bool
    delete_default_routes_on_create           = bool
    mtu                                       = number
    network_firewall_policy_enforcement_order = string
    routing_mode                              = string
  })
}

variable "learning-vpc-subnets" {
  type = object({
    subnets          = list(map(string))
    secondary_ranges = map(list(object({ range_name = string, ip_cidr_range = string })))
  })
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  default     = ""
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork on which the IP address will be reserved"
  default     = ""
}

