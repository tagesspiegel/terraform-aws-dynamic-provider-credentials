<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfc_aws_dynamic_credentials"></a> [tfc\_aws\_dynamic\_credentials](#module\_tfc\_aws\_dynamic\_credentials) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AWS_ACCESS_KEY_ID"></a> [AWS\_ACCESS\_KEY\_ID](#input\_AWS\_ACCESS\_KEY\_ID) | The AWS access key | `any` | n/a | yes |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | The AWS zone to use for the resources | `string` | `"eu-central-1"` | no |
| <a name="input_AWS_SECRET_ACCESS_KEY"></a> [AWS\_SECRET\_ACCESS\_KEY](#input\_AWS\_SECRET\_ACCESS\_KEY) | The AWS secret key | `any` | n/a | yes |
| <a name="input_AWS_SESSION_TOKEN"></a> [AWS\_SESSION\_TOKEN](#input\_AWS\_SESSION\_TOKEN) | The AWS session token | `any` | n/a | yes |
| <a name="input_TFC_ORGANIZATION"></a> [TFC\_ORGANIZATION](#input\_TFC\_ORGANIZATION) | The name of the Terraform Cloud organization | `string` | `"my-organization"` | no |
| <a name="input_TFC_PROJECT_NAME"></a> [TFC\_PROJECT\_NAME](#input\_TFC\_PROJECT\_NAME) | The name of the Terraform Cloud project | `string` | `"my-project"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->