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
  description = "(*Optional*) The existing billing export information, should contain the information from the management account."
  default     = null
  nullable    = true

  validation {
    condition = (
      var.account_type != "sub" || (
        can(var.billing_info) && can(var.billing_info.billing_export_email) && can(var.billing_info.billing_export_project_id) &&
        var.billing_info.billing_export_table != "" &&
        var.billing_info.billing_export_email != "" &&
        var.billing_info.billing_export_project_id != ""
      )
    )
    error_message = "The 'billing_info' input must be provided for sub accounts."
  }

  validation {
    condition = (
      var.account_type != "sub" || (
        can(var.billing_info) && can(var.billing_info.billing_export_table) &&
        length(regexall("^[a-zA-Z0-9_-]+\\.[a-zA-Z0-9_-]+\\.[a-zA-Z0-9_-]+$", var.billing_info.billing_export_table)) > 0
      )
    )
    error_message = "The 'billing_info.billing_export_table' field must conform to the form `<billing_export_project_id>.<billing_export_dataset_name>.<billing_export_table_name>`."
  }
}

variable "existing_account_id" {
  type        = string
  description = "(**Optional**) The existing GCP Account ID. If not provided, a new service account will be created"
  default     = ""
}

variable "token" {
  type        = string
  description = "(**Required**) The token to authenticate with the Attribute API."
}
