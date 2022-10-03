# Copyright 2021 Peoplefun, Inc.
# This software is provided as is, without any warranty or representation for
# any use or purpose. Your use of it is subject to your agreement with Peoplefun.

# Remote backend GCS output
output "bucket_created" {
  value = google_storage_bucket.remote_state.name
}