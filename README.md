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
## Registration
The registration process is fully automated. The module will register the sensor with the Attribute API via the `http` provider.
## Account name
Account name can be provided via the `account_name` input, or automatically extracted with the `google_projects` datasource.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                             | Version      |
| ---------------------------------------------------------------- | ------------ |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0, <7.0 |

## Providers

| Name                                                       | Version      |
| ---------------------------------------------------------- | ------------ |
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.0, <7.0 |
| <a name="provider_http"></a> [http](#provider\_http)       | n/a          |

## Modules

No modules.

## Resources

| Name                                                                                                                                                               | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [google_bigquery_dataset_iam_member.bigquery_internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_iam_member) | resource    |
| [google_project_iam_member.internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member)                            | resource    |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service)                                      | resource    |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account)                                      | resource    |
| [google_service_account_iam_member.impersonator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member)        | resource    |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config)                                    | data source |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project)                                                | data source |
| [google_projects.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects)                                              | data source |
| [http_http.attribute_registration](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                                           | data source |

## Inputs

| Name                                                                                                                      | Description                                                                                                                                                                                                  | Type     | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | :------: |
| <a name="input_account_type"></a> [account\_type](#input\_account\_type)                                                  | (**Required**) The GCP Account type. Available options are: 'management' or 'sub'. In case of 'management', the 'billing\_export\_dataset\_name' and 'billing\_export\_table\_name' inputs must be provided. | `string` | n/a     |   yes    |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id)                                         | (**Required**) The Organization ID provided by Attribute.                                                                                                                                                    | `string` | n/a     |   yes    |
| <a name="input_token"></a> [token](#input\_token)                                                                         | (**Required**) The token to authenticate with the Attribute API.                                                                                                                                             | `string` | n/a     |   yes    |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name)                                                  | (*Optional*) The GCP Account name. If not provided, the account name will be extracted with the datasource.                                                                                                  | `string` | `""`    |    no    |
| <a name="input_billing_export_dataset_name"></a> [billing\_export\_dataset\_name](#input\_billing\_export\_dataset\_name) | (**Optional**) The name of the billing export dataset.                                                                                                                                                       | `string` | `""`    |    no    |
| <a name="input_billing_export_table_name"></a> [billing\_export\_table\_name](#input\_billing\_export\_table\_name)       | (**Optional**) The name of the billing export table.                                                                                                                                                         | `string` | `""`    |    no    |
| <a name="input_enable_required_apis"></a> [enable\_required\_apis](#input\_enable\_required\_apis)                        | (*Optional*) Whether to enabled required GCP APIs. Default is 'false'.                                                                                                                                       | `bool`   | `false` |    no    |

## Outputs

| Name                                                                                                                                 | Description                                |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------ |
| <a name="output_internal_service_account_email"></a> [internal\_service\_account\_email](#output\_internal\_service\_account\_email) | The email of the internal service account. |
<!-- END_TF_DOCS -->