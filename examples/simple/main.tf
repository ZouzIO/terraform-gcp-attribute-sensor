terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0, <7.0"
    }
  }

  backend "gcs" {}
}

# The target project can be set here ( 'project' argument or the GOOGLE_PROJECT environment variable ),
# or passed to the module via the 'project_id' input
provider "google" {}

module "attribute_sensor" {
  source = "../.."

  token           = var.token
  organization_id = var.organization_id

  # Optional. Takes precedence over the project configured on the provider
  project_id = var.project_id

  account_type                = var.account_type
  billing_export_dataset_name = var.billing_export_dataset_name
  billing_export_table_name   = var.billing_export_table_name
  billing_info                = var.billing_info
}
