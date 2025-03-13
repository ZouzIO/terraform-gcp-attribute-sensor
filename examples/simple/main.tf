terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0, <7.0"
    }
  }
}

provider "google" {
  project = "my-project-12345"
  region  = "us-central1"
}

module "attribute_management" {
  source  = "ZouzIO/attribute-sensor/gcp"
  version = "~> 1.0"

  token           = var.token
  organization_id = var.organization_id

  account_type                = "management"
  billing_export_dataset_name = var.billing_export_dataset_name
  billing_export_table_name   = var.billing_export_table_name
}
