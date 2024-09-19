variable "billing_export_dataset_name" {
  type        = string
  description = "(**Required**) The name of the billing export dataset to create."
}

variable "attribute_authorized_dataset_name" {
  type        = string
  description = "(*Optional*) The name of the Attribute dataset to be authorized."
  default     = ""
}

variable "enable_required_apis" {
  type        = bool
  description = "(*Optional*) Whether to enabled required GCP APIs. Default is 'false'."
  default     = false
}
