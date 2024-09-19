# terraform-gcp-attribute-sensor
The module provisions all required infrastracture resources for the Attribute Sensor to operate. Please, refer to the [Input](#inputs) section for the configuration options.
## Registration Methods
### Manual
Currently, he Attribute Sensor must be registered manually. To do that, follow the steps below:
* Apply the module to create the required resources.
* Configure the Billing Export to use the dataset created by the module.
* Wait for the Billing Export to create a table inside the dataset ( takes around 24 hours).
* Provide all outputs from the module and the table name to Attribute.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0, <7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.0, <7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_project_iam_member.internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.impersonator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_export_dataset_name"></a> [billing\_export\_dataset\_name](#input\_billing\_export\_dataset\_name) | (**Required**) The name of the billing export dataset to create. | `string` | n/a | yes |
| <a name="input_attribute_authorized_dataset_name"></a> [attribute\_authorized\_dataset\_name](#input\_attribute\_authorized\_dataset\_name) | (*Optional*) The name of the Attribute dataset to be authorized. | `string` | `""` | no |
| <a name="input_enable_required_apis"></a> [enable\_required\_apis](#input\_enable\_required\_apis) | (*Optional*) Whether to enabled required GCP APIs. Default is 'false'. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_exporter_dataset_name"></a> [billing\_exporter\_dataset\_name](#output\_billing\_exporter\_dataset\_name) | The name of the billing export dataset. |
| <a name="output_internal_service_account_email"></a> [internal\_service\_account\_email](#output\_internal\_service\_account\_email) | The email of the internal service account. |
<!-- END_TF_DOCS -->