# terraform-gcp-attribute-sensor
The module provisions all required infrastracture resources for the Attribute Sensor to operate. Please, refer to the [Input](#inputs) section for the configuration options.
## Prerequisites
Except the required [inputs](#inputs), the following resources must be created before using the module:
- Billing Export Dataset
- Billing Export Resource

It usually takes up to 24 hours for the billing export to be created in the BigQuery dataset. For additional details about the billing export, please refer to the Attribute deployment guide provided.
## Account types
The module supports two account types: `management` and `sub`. You can use a single `management` account and multiple `sub` accounts in the same organization.
### Management
The following resources are created in the management account:
- Service account with required permissions
- Billing Export Dataset permissions ( optional )
### Sub
The following resources are created in the sub account:
- Service account with required permissions

The sub account requires the [billing\_info](#input\_billing\_info) input to be provided. The information should contain the billing export table, email and project ID from the management account. It's recommended to use outputs from the management account to populate the input, i.e.:
```hcl
module "attribute_management" {
  ...
  account_type                = "management"
  billing_export_dataset_name = var.billing_export_dataset_name
  billing_export_table_name   = var.billing_export_table_name
}

module "attribute_subaccount1" {
  ...
  account_type = "sub"
  billing_info = module.attribute_management.billing_info
}
```
## Registration
The registration process is fully automated. The module will register the sensor with the Attribute API via the `http` provider.
## Account name
Account name can be provided via the `account_name` input, or automatically extracted with the `google_projects` datasource.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0, < 8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.0, < 8.0 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset_iam_member.bigquery_internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member) | resource |
| [google_project_iam_member.internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.impersonator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_projects.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [http_http.attribute_registration](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | (**Required**) The GCP Account type. Available options are: 'management' or 'sub'. In case of 'management', the 'billing\_export\_dataset\_name' and 'billing\_export\_table\_name' inputs must be provided. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | (**Required**) The Organization ID provided by Attribute. | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | (**Required**) The token to authenticate with the Attribute API. | `string` | n/a | yes |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | (*Optional*) The GCP Account name. If not provided, the account name will be extracted with the datasource. | `string` | `""` | no |
| <a name="input_billing_export_dataset_name"></a> [billing\_export\_dataset\_name](#input\_billing\_export\_dataset\_name) | (**Optional**) The name of the billing export dataset. | `string` | `""` | no |
| <a name="input_billing_export_table_name"></a> [billing\_export\_table\_name](#input\_billing\_export\_table\_name) | (**Optional**) The name of the billing export table. | `string` | `""` | no |
| <a name="input_billing_info"></a> [billing\_info](#input\_billing\_info) | (*Optional*) The existing billing export information. Required for sub accounts. | <pre>object({<br>    billing_export_table      = string<br>    billing_export_email      = string<br>    billing_export_project_id = string<br>  })</pre> | <pre>{<br>  "billing_export_email": "",<br>  "billing_export_project_id": "",<br>  "billing_export_table": ""<br>}</pre> | no |
| <a name="input_enable_required_apis"></a> [enable\_required\_apis](#input\_enable\_required\_apis) | (*Optional*) Whether to enabled required GCP APIs. Default is 'false'. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The ID of the GCP account. |
| <a name="output_billing_export_table"></a> [billing\_export\_table](#output\_billing\_export\_table) | The billing export table. |
| <a name="output_billing_info"></a> [billing\_info](#output\_billing\_info) | The billing export information. |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the internal service account. |
<!-- END_TF_DOCS -->