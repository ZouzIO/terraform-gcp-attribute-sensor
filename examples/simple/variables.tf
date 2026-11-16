variable "organization_id" {
  type        = string
  description = "The Organization ID provided by Attribute."
}

variable "token" {
  type        = string
  description = "The token provided by Attribute."
}

variable "project_id" {
  type        = string
  description = "(*Optional*) The ID of the GCP project to deploy the resources to. If not provided, the project configured on the provider is used."
  default     = null
}

variable "billing_export_dataset_name" {
  type        = string
  description = "The Billing Export dataset name."
  default     = ""
}

variable "billing_export_table_name" {
  type        = string
  description = "The Billing Export table name."
  default     = ""
}

variable "account_type" {
  type        = string
  description = "Account type to create"
}

variable "billing_info" {
  type = object({
    billing_export_table      = string
    billing_export_email      = string
    billing_export_project_id = string
  })
  description = "(*Optional*) The existing billing export information. Required for sub accounts."

  default = {
    billing_export_table      = ""
    billing_export_email      = ""
    billing_export_project_id = ""
  }
}
