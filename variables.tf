variable "organization_id" {
  type        = string
  description = "(**Required**) The Organization ID provided by Attribute."
}

variable "billing_export_dataset_name" {
  type        = string
  description = "(**Optional**) The name of the billing export dataset."
  default     = ""
}

variable "billing_export_table_name" {
  type        = string
  description = "(**Optional**) The name of the billing export table."
  default     = ""

  validation {
    condition     = var.billing_export_table_name == "" || can(regex("^gcp_billing_export_resource_v1", var.billing_export_table_name))
    error_message = "If provided, billing_export_table_name must start with 'gcp_billing_export_resource_v1'."
  }
}

variable "enable_required_apis" {
  type        = bool
  description = "(*Optional*) Whether to enabled required GCP APIs. Default is 'false'."
  default     = false
}

variable "account_type" {
  type        = string
  description = "(**Required**) The GCP Account type. Available options are: 'management' or 'sub'. In case of 'management', the 'billing_export_dataset_name' and 'billing_export_table_name' inputs must be provided."

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

  validation {
    condition = (
      var.account_type != "sub" || (
        var.billing_info.billing_export_table != "" &&
        var.billing_info.billing_export_email != "" &&
        var.billing_info.billing_export_project_id != "" &&
        length(regexall("^(.*)\\.(.*)\\.(.*)$", var.billing_info.billing_export_table)) > 0
      )
    )
    error_message = <<EOT
When account_type is "sub", billing_info must be fully provided:
- billing_export_table, billing_export_email, billing_export_project_id must be non-empty.
- billing_export_table must match "<project>.<dataset>.<table>" format.
EOT
  }
}

variable "token" {
  type        = string
  description = "(**Required**) The token to authenticate with the Attribute API."
}
