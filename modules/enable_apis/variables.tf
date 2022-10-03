variable "project_id" {
  type = string
}

variable "service_list" {
  description = "List of GCP service to be enabled for a project."
  type        = list(string)
  default = [
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "oslogin.googleapis.com",
    "secretmanager.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "vpcaccess.googleapis.com",
    "remotebuildexecution.googleapis.com",
    "cloudbuild.googleapis.com"
  ]
}