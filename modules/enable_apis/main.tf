#Enable services to be used in the project
resource "google_project_service" "enable_service" {
  for_each           = { for i in var.service_list : i => i }
  service            = each.value
  project            = var.project_id
  disable_on_destroy = true
}