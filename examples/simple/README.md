<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 6.0, <7.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_attribute_sensor"></a> [attribute\_sensor](#module\_attribute\_sensor) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_type"></a> [account\_type](#input\_account\_type) | Account type to create | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The Organization ID provided by Attribute. | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | The token provided by Attribute. | `string` | n/a | yes |
| <a name="input_billing_export_dataset_name"></a> [billing\_export\_dataset\_name](#input\_billing\_export\_dataset\_name) | The Billing Export dataset name. | `string` | `""` | no |
| <a name="input_billing_export_table_name"></a> [billing\_export\_table\_name](#input\_billing\_export\_table\_name) | The Billing Export table name. | `string` | `""` | no |
| <a name="input_billing_info"></a> [billing\_info](#input\_billing\_info) | (*Optional*) The existing billing export information. Required for sub accounts. | <pre>object({<br>    billing_export_table      = string<br>    billing_export_email      = string<br>    billing_export_project_id = string<br>  })</pre> | <pre>{<br>  "billing_export_email": "",<br>  "billing_export_project_id": "",<br>  "billing_export_table": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_info"></a> [billing\_info](#output\_billing\_info) | n/a |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | n/a |
<!-- END_TF_DOCS -->