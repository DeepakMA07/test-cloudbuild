# Setup cloud build trigger for DEV Branch
resource "google_cloudbuild_trigger" "cloud_build_trigger" {
  for_each    = var.trigger_type
  name        = each.key
  description = each.value.description
  project     = var.project_id
  github {
    owner = var.github_owner_name
    name  = var.github_repo_name
    push {
      branch = var.branch_map[var.project_id]
      # invert_regex = true
    }
  }
  substitutions  = each.value.substitutions
  filename       = each.value.config_file_path
  included_files = each.value.include_file_list
  ignored_files  = each.value.ignored_files_list
}