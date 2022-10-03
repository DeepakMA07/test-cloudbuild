# Copyright 2021 Peoplefun, Inc.
# This software is provided as is, without any warranty or representation for
# any use or purpose. Your use of it is subject to your agreement with Peoplefun.

# Remote backend GCS variables
variable "project_id" {
  type = string
  description = "GCP project id"
}

variable "project_number" {
  type = string
}

variable "bucket_location" {
  default = "US-CENTRAL1"
}
