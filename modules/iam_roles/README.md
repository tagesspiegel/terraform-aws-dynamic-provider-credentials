<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.59 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_custom_policies"></a> [aws\_iam\_custom\_policies](#input\_aws\_iam\_custom\_policies) | A list of custom policies to attach to the IAM role. By default the provider will be allowed to perform all actions on all ec2 resources. | <pre>list(object({<br/>    Effect   = string<br/>    Action   = list(string)<br/>    Resource = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "Action": [<br/>      "ec2:*"<br/>    ],<br/>    "Effect": "Allow",<br/>    "Resource": "*"<br/>  }<br/>]</pre> | no |
| <a name="input_aws_iam_role_name_override"></a> [aws\_iam\_role\_name\_override](#input\_aws\_iam\_role\_name\_override) | The name of the IAM role to create. If not set, the name will be generated automatically. | `string` | `"terraform-cloud-dynamic-credentials"` | no |
| <a name="input_statements"></a> [statements](#input\_statements) | The list of statements to use for the trust relationship | <pre>set(object({<br/>    org_name     = string<br/>    project_name = string<br/>    workspace    = string<br/>    run_phase    = string<br/>  }))</pre> | n/a | yes |
| <a name="input_tfc_hostname"></a> [tfc\_hostname](#input\_tfc\_hostname) | The hostname of the TFC or TFE instance you'd like to use with AWS | `string` | `"app.terraform.io"` | no |
| <a name="input_tfc_oidc_provider_arn"></a> [tfc\_oidc\_provider\_arn](#input\_tfc\_oidc\_provider\_arn) | The ARN of the OIDC provider to use for TFC | `string` | n/a | yes |
| <a name="input_tfc_oidc_provider_client_id_list"></a> [tfc\_oidc\_provider\_client\_id\_list](#input\_tfc\_oidc\_provider\_client\_id\_list) | The list of client IDs to use for TFC | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A combination of project and workspace name |
| <a name="output_openid_claims"></a> [openid\_claims](#output\_openid\_claims) | OpenID Claims for trust relationship |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN for trust relationship role |
<!-- END_TF_DOCS -->