data "http" "attribute_registration" {
  request_headers = {
    "Content-Type"  = "application/json"
    "Authorization" = "Bearer ${var.token}",
  }

  url    = "https://sensor.stage.attrb.io/api/v1/gcp"
  method = "POST"

  request_body = jsonencode(merge({
    "organization_id" = var.organization_id
    "project_id"      = data.google_project.current.project_id,
    "project_name"    = var.account_name == "" ? data.google_projects.current.projects.0.name : var.account_name,
    "sa_email"        = google_service_account.this.email,
    },
    var.account_type == "management" ? {
      "billing_export_table" = "${data.google_project.current.project_id}.${var.billing_export_dataset_name}.${var.billing_export_table_name}",
    } : {})
  )
}
