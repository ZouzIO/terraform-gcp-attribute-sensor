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

resource "google_bigquery_dataset" "this" {
  dataset_id = "billing_export"
  location   = "us-central1"

  dynamic "access" {
    for_each = length(var.attribute_authorized_dataset_name) > 0 ? [1] : []
    content {
      dataset {
        dataset {
          project_id = "zouz-prod"
          dataset_id = var.attribute_authorized_dataset_name
        }
        target_types = ["VIEWS"]
      }
    }
  }

  access {
    user_by_email = google_service_account.this.email
    role          = "READER"
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }

  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    user_by_email = "billing-export-bigquery@system.gserviceaccount.com"
  }
}
