<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.32 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.32.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_custom_policies"></a> [aws\_iam\_custom\_policies](#input\_aws\_iam\_custom\_policies) | A list of custom policies to attach to the IAM role. By default the provider will be allowed to perform all actions on all ec2 resources. | <pre>list(object({<br>    Effect   = string<br>    Action   = list(string)<br>    Resource = string<br>  }))</pre> | <pre>[<br>  {<br>    "Action": [<br>      "ec2:*"<br>    ],<br>    "Effect": "Allow",<br>    "Resource": "*"<br>  }<br>]</pre> | no |
| <a name="input_aws_iam_role_name_override"></a> [aws\_iam\_role\_name\_override](#input\_aws\_iam\_role\_name\_override) | The name of the IAM role to create. If not set, the name will be generated automatically. | `string` | `""` | no |
| <a name="input_tfc_oidc_provider_arn"></a> [tfc\_oidc\_provider\_arn](#input\_tfc\_oidc\_provider\_arn) | The ARN of the OIDC provider to use for TFC | `string` | n/a | yes |
| <a name="input_tfc_oidc_provider_client_id_list"></a> [tfc\_oidc\_provider\_client\_id\_list](#input\_tfc\_oidc\_provider\_client\_id\_list) | The list of client IDs to use for TFC | `list(string)` | n/a | yes |
| <a name="input_tfc_organization_name"></a> [tfc\_organization\_name](#input\_tfc\_organization\_name) | The name of the TFC or TFE organization you'd like to use with AWS | `string` | `"Tagesspiegel"` | no |
| <a name="input_tfc_project_name"></a> [tfc\_project\_name](#input\_tfc\_project\_name) | The name of the TFC or TFE project you'd like to use with AWS | `string` | n/a | yes |
| <a name="input_tfc_run_phase"></a> [tfc\_run\_phase](#input\_tfc\_run\_phase) | The run phase to use for the trust relationship | `string` | `"*"` | no |
| <a name="input_tfc_workspace_name"></a> [tfc\_workspace\_name](#input\_tfc\_workspace\_name) | The name of the TFC or TFE workspace you'd like to use with AWS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A combination of project and workspace name |
| <a name="output_openid_claims"></a> [openid\_claims](#output\_openid\_claims) | OpenID Claims for trust relationship |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN for trust relationship role |
<!-- END_TF_DOCS -->