# Project Id
variable "project_id" {
  type = string
}

# Github repo owner name
variable "github_owner_name" {
  type    = string
  default = "DeepakMA07"
}

# Github repo name
variable "github_repo_name" {
  type    = string
  default = "Hadoop_GCP_Migration"
}

# GCP Project Mapping with Branch
variable "branch_map" {
  type = map
  default = {
    "ml-console-dev" = "^master$",
    "Hadoop_GCP_Migration" = "^test$"
    # "sample" = "^sample$"
  }
}

# Cloud Build Trigger Details
variable "trigger_type" {
  type = map(any)
  default = {
    hadoop-gcp = {
      description        = "CI/CD for deploying Infrastructure using Terraform",
      config_file_path   = "hg-segmentation/cloudbuild/cloudbuild.yaml",
      include_file_list  = ["hg-segmentation/wisdb/Infra/**"],
      ignored_files_list = [],
      substitutions      = {}
    }
  }
}
#test
