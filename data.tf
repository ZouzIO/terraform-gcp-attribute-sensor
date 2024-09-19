data "google_project" "current" {}

data "google_client_config" "current" {}

data "google_projects" "current" {
  filter = "id:${data.google_client_config.current.project}"
}
