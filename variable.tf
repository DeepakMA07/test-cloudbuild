variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "project_number" {
  type = string
}

variable "region" {
  description = "The region for resources"
  type        = string
  default     = "us-central1"
}
