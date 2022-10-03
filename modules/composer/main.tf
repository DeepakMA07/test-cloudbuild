locals {
cloud_composer = {
name = "cloud-composer-${var.project_id}"
region = "us-west1"
node_count = 3
zone = "us-west1-b"
machine_type = "n1-standard-1"
}
}

resource "google_composer_environment" "cloud-composer" {
project    = var.project_id    
name = "${local.cloud_composer["name"]}"
region = "${local.cloud_composer["region"]}"
config {
node_count = "${local.cloud_composer["node_count"]}"

node_config {
zone = "${local.cloud_composer["zone"]}"
machine_type = "${local.cloud_composer["machine_type"]}"
}
}
}