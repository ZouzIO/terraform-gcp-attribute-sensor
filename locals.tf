locals {
  required_gcp_apis = [
    "cloudresourcemanager.googleapis.com",
    "sqladmin.googleapis.com",
    "iam.googleapis.com"
  ]

  sa_roles = [
    "roles/monitoring.viewer",
    "roles/cloudsql.viewer",
    "roles/bigquery.jobUser",
  ]
}
