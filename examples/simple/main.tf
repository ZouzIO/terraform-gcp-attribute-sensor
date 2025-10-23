terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0, <7.0"
    }
  }

  backend "gcs" {}
}

provider "google" {}

module "attribute_sensor" {
  source = "../.."

  token           = var.token
  organization_id = var.organization_id

  account_type                = var.account_type
  billing_export_dataset_name = var.billing_export_dataset_name
  billing_export_table_name   = var.billing_export_table_name
  billing_info                = var.billing_info
}
