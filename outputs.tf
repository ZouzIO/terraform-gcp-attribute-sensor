output "billing_exporter_dataset_name" {
  value = google_bigquery_dataset.this.dataset_id
}

output "internal_service_account_email" {
  value = google_service_account.this.email
}
