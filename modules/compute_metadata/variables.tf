variable "project_id" {
  description = "The ID of the Project"
  type        = string
}

variable "metadata" {
  description = "The map of metadata"
  type        = map(string)
  default        = {}
}