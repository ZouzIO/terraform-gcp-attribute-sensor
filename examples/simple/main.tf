terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0, <7.0"
    }
  }
}

provider "google" {
  project = "project-id"
  region  = "us-central1"
  zone    = "us-central1-c"
}


module "billing_export" {
  source = "../../"

  billing_export_dataset_name       = "billing_export"
  attribute_authorized_dataset_name = "5e482183_a53c_46f2_9f8d_53366bbda8f8_reports"

  enable_required_apis = true
}
