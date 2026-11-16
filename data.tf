# Resolves the target project: the 'project_id' input, or the provider's project when it is not set
data "google_project" "current" {
  project_id = var.project_id
}

data "google_projects" "current" {
  filter = "id:${data.google_project.current.project_id}"
}
