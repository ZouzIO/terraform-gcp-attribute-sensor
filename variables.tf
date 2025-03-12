variable "organization_id" {
  type        = string
  description = "(**Required**) The Organization ID provided by Attribute."
}

variable "billing_export_dataset_name" {
  type        = string
  description = "(**Options**) The name of the billing export dataset."
  default     = ""
}

variable "billing_export_table_name" {
  type        = string
  description = "(**Options**) The name of the billing export table."
  default     = ""
}

variable "authorize_attribute_dataset" {
  type        = bool
  description = "(*Optional*) Whether to authorize the Attribute dataset access to the billing exports."
  default     = true
}

variable "enable_required_apis" {
  type        = bool
  description = "(*Optional*) Whether to enabled required GCP APIs. Default is 'false'."
  default     = false
}

variable "account_type" {
  type        = string
  description = "(**Required**) The GCP Account type. Available options are: 'management' or 'sub'."

  validation {
    condition     = contains(["management", "sub"], var.account_type)
    error_message = "Invalid account type. Must be 'management' or 'sub'."
  }

  validation {
    condition     = var.account_type != "management" || (can(var.billing_export_dataset_name) && can(var.billing_export_table_name) && var.billing_export_dataset_name != "" && var.billing_export_table_name != "")
    error_message = "The 'billing_export_dataset_name' and 'billing_export_table_name' inputs must be provided for the management account."
  }
}

variable "account_name" {
  type        = string
  description = "(*Optional*) The GCP Account name. If not provided, the account name will be extracted with the datasource."
  default     = ""
}

variable "token" {
  type        = string
  description = "(**Required**) The token to authenticate with the Attribute API."
}
