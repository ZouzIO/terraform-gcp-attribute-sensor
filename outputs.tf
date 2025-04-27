output "service_account_email" {
  description = "The email of the internal service account."
  value       = google_service_account.this.email
}

output "account_id" {
  description = "The ID of the GCP account."
  value       = google_service_account.this.account_id
}

output "billing_export_table" {
  description = "The billing export table."
  value       = var.billing_export_table_name
}
