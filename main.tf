# The Google provider is used to configure your Google Cloud Platform infrastructure.

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}


# Setup Terraform backend to maintain tfstate file on GCS,
# State is initialised when <Name of backend bucket> is passed in terraform init command,
# It will create a folder with name "state" in the backend bucket


terraform {
  backend "gcs" {
    prefix = "pre_setup_state"
  }
}


# Enable GCP Service
# module "enable_service" {
#   source     = "./modules/enable_service"
#   project_id = var.project_id
# }

# Cloud Build Trigger for CI/CD
module "cloud_build_trigger" {
  source     = "./modules/cloud_build_trigger"
  project_id = var.project_id
}

# BigQuery Module, the code for BIGQUERY resources is in module/bigquery folder
# module "bigquery" {
#   source     = "./modules/bigquery"
#   project_id = var.project_id
# }

# cloud-composer
# module "composer" {
#   source     = "./modules/composer"
#   project_id = var.project_id
# }