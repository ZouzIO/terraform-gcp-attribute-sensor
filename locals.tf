locals {
  required_gcp_apis = [
    "sqladmin.googleapis.com",
  ]

  sa_roles = [
    "roles/monitoring.viewer",
    "roles/cloudsql.viewer",
    "roles/bigquery.jobUser",
    "roles/compute.viewer",
  ]
}
