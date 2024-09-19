output "billing_exporter_dataset_name" {
  description = "The name of the billing export dataset."
  value       = google_bigquery_dataset.this.dataset_id
}

output "internal_service_account_email" {
  description = "The email of the internal service account."
  value       = google_service_account.this.email
}
