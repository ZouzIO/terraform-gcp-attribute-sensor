variable "billing_export_dataset_name" {
  type        = string
  description = "(**Required**) The name of the billing export dataset."
}

variable "attribute_authorized_dataset_name" {
  type        = string
  description = "(**Required**) The name of the dataset to be authorized."
}

variable "enable_required_apis" {
  type        = bool
  description = "(*Optional*) Whether to enabled required GCP APIs. Default is 'true'."
  default     = false
}
