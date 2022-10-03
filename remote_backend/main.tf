# Copyright 2021 Peoplefun, Inc.
# This software is provided as is, without any warranty or representation for
# any use or purpose. Your use of it is subject to your agreement with Peoplefun.

# Set up provider
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
}

# Create GCS bucket to store terraform state file with versioning enabled
resource "google_storage_bucket" "remote_state" {
  name                        = "${var.project_id}-terraform-test"
  uniform_bucket_level_access = true
  location                    = var.bucket_location

  versioning {
    enabled = "true"
  }
}