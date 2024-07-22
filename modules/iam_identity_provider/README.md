<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.59 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [random_string.sfx1](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.sfx2](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_certificate.tfc_certificate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfc_aws_audience"></a> [tfc\_aws\_audience](#input\_tfc\_aws\_audience) | The audience value to use in run identity tokens | `string` | `"aws.workload.identity"` | no |
| <a name="input_tfc_hostname"></a> [tfc\_hostname](#input\_tfc\_hostname) | The hostname of the TFC or TFE instance you'd like to use with AWS | `string` | `"app.terraform.io"` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The name of the TFC or TFE organization you'd like to use with AWS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_oidc_tfc_provider_arn"></a> [aws\_oidc\_tfc\_provider\_arn](#output\_aws\_oidc\_tfc\_provider\_arn) | The ARN of the AWS IAM OIDC Identity Provider created for TFC |
| <a name="output_aws_oidc_tfc_provider_client_id_list"></a> [aws\_oidc\_tfc\_provider\_client\_id\_list](#output\_aws\_oidc\_tfc\_provider\_client\_id\_list) | The list of client IDs for the AWS IAM OIDC Identity Provider created for TFC |
| <a name="output_aws_tfc_audience"></a> [aws\_tfc\_audience](#output\_aws\_tfc\_audience) | The audience for the AWS IAM OIDC Identity Provider created for TFC |
<!-- END_TF_DOCS -->