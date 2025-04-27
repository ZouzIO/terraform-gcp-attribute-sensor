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
| <a name="module_attribute_management"></a> [attribute\_management](#module\_attribute\_management) | ZouzIO/attribute-sensor/gcp | ~> 1.0 |
| <a name="module_attribute_subaccount1"></a> [attribute\_subaccount1](#module\_attribute\_subaccount1) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_export_dataset_name"></a> [billing\_export\_dataset\_name](#input\_billing\_export\_dataset\_name) | The Billing Export dataset name. | `string` | n/a | yes |
| <a name="input_billing_export_table_name"></a> [billing\_export\_table\_name](#input\_billing\_export\_table\_name) | The Billing Export table name. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The Organization ID provided by Attribute. | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | The token provided by Attribute. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_exporter_dataset_name"></a> [billing\_exporter\_dataset\_name](#output\_billing\_exporter\_dataset\_name) | n/a |
| <a name="output_internal_service_account_email"></a> [internal\_service\_account\_email](#output\_internal\_service\_account\_email) | n/a |
<!-- END_TF_DOCS -->