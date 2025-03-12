output "internal_service_account_email" {
  description = "The email of the internal service account."
  value       = google_service_account.this.email
}
