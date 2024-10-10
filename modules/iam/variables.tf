variable "project_id" {
  description = "The ID of the Project"
  default     = ""
  type        = string
}

variable "service_account" {
  description = "Name of the service account needs to be created"
  default = []
}

variable "display_name" {
  description = "The display name of the service account to be created"
  type = string
  default = ""
}