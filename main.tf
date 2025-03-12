resource "google_project_service" "this" {
  for_each = var.enable_required_apis ? toset(local.required_gcp_apis) : []

  service = each.value
}

resource "google_service_account" "this" {
  account_id   = "attribute-sensor"
  display_name = "The Attribute Sensor Service Account"
}

resource "google_project_iam_member" "internal" {
  for_each = toset(local.sa_roles)

  project = data.google_project.current.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_service_account_iam_member" "impersonator" {
  service_account_id = google_service_account.this.name

  role   = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:zouz-env-agg@web-official-377608.iam.gserviceaccount.com"
}

resource "google_bigquery_dataset_iam_member" "bigquery_internal" {
  count = var.account_type == "management" && var.authorize_attribute_dataset ? 1 : 0

  dataset_id = var.billing_export_dataset_name

  role   = "roles/bigquery.dataViewer"
  member = "serviceAccount:${google_service_account.this.email}"
}

resource "google_bigquery_dataset_access" "authorized_dataset" {
  count = var.account_type == "management" && var.authorize_attribute_dataset ? 1 : 0

  dataset_id = var.billing_export_dataset_name
  project    = data.google_project.current.project_id
  dataset {
    dataset {
      project_id = "zouz-prod"
      dataset_id = "${replace(var.organization_id, "-", "_")}_reports"
    }
    target_types = ["VIEWS"]
  }

}
