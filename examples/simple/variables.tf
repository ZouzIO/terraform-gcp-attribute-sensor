variable "organization_id" {
  type        = string
  description = "The Organization ID provided by Attribute."
}

variable "token" {
  type        = string
  description = "The token provided by Attribute."
}

variable "billing_export_dataset_name" {
  type        = string
  description = "The Billing Export dataset name."
}

variable "billing_export_table_name" {
  type        = string
  description = "The Billing Export table name."
}
