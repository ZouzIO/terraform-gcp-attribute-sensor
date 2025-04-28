output "service_account_email" {
  description = "The email of the internal service account."
  value       = google_service_account.this.email
}

output "account_id" {
  description = "The ID of the GCP account."
  value       = data.google_project.current.project_id
}

output "billing_export_table" {
  description = "The billing export table."
  value       = "${google_service_account.this.account_id}.${var.billing_export_dataset_name}.${var.billing_export_table_name}"
}

output "billing_info" {
  description = "The billing export information."
  value = {
    billing_export_table      = "${data.google_project.current.project_id}.${var.billing_export_dataset_name}.${var.billing_export_table_name}"
    billing_export_email      = google_service_account.this.email
    billing_export_project_id = google_service_account.this.project
  }
}
