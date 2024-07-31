# Terraform AWS dynamic provider credentials

This module creates a dynamic credentials setup between AWS and Terraform Cloud (project). It creates an IAM policy, IAM role, and IAM role policy attachment. It also creates a Terraform Cloud variable set with the AWS configurations. For more information on dynamic provider credentials, see [Dynamic Provider Credentials](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials).

## Usage

```terraform
// one-time credentials to setup the dynamic credentials
// this is the only time you need to provide credentials
// after this, the dynamic credentials will be used.
// If the setup was successful, `access_key` and `secret_key` should be removed.
provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "aws_dynamic_provider_credentials" {
  source  = "tagesspiegel/dynamic-provider-credentials/aws"
  version = "1.0.0"

  tfc_organization = "my-org"
  tfc_project      = "my-project"

  tfc_workspaces = [{
    name_override = "my-project-auth"
    workspace     = "*"
    run_phase     = "*"
    policies = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ram:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "kms:*"
        ]
        Resource = "*"
      }
    ]
  }]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.59 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.57.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_identity_provider"></a> [aws\_identity\_provider](#module\_aws\_identity\_provider) | ./modules/iam_identity_provider | n/a |
| <a name="module_aws_tfc_dynamic_credentials_iam_roles"></a> [aws\_tfc\_dynamic\_credentials\_iam\_roles](#module\_aws\_tfc\_dynamic\_credentials\_iam\_roles) | ./modules/iam_roles | n/a |

## Resources

| Name | Type |
|------|------|
| [tfe_project_variable_set.tfc_project](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_variable.tfe_aws_provider_auth](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tfe_aws_provider_auth_arn](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.tfc_aws_dynamic_credentials](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_project.tfc_project](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamic_credentials_role_name_override"></a> [dynamic\_credentials\_role\_name\_override](#input\_dynamic\_credentials\_role\_name\_override) | The name of the IAM role to create. If not set, the name will be generated automatically. | `string` | `"terraform-cloud-dynamic-credentials"` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | A list of custom policies to attach to the IAM role. By default the provider will be allowed to perform all actions on all ec2 resources. | <pre>set(object({<br>    Effect   = string<br>    Action   = set(string)<br>    Resource = string<br>  }))</pre> | `[]` | no |
| <a name="input_statements"></a> [statements](#input\_statements) | The list of statements to use for the trust relationship | <pre>set(object({<br>    org_name     = string<br>    project_name = string<br>    workspace    = string<br>    run_phase    = optional(string, "*")<br>  }))</pre> | n/a | yes |
| <a name="input_tfc_aws_audience"></a> [tfc\_aws\_audience](#input\_tfc\_aws\_audience) | AWS audience | `string` | `"aws.workload.identity"` | no |
| <a name="input_tfc_hostname"></a> [tfc\_hostname](#input\_tfc\_hostname) | The hostname of the TFC or TFE instance you'd like to use with AWS | `string` | `"app.terraform.io"` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Name of the organization | `string` | n/a | yes |
| <a name="input_tfc_project"></a> [tfc\_project](#input\_tfc\_project) | Name of the terraform cloud/enterprise project | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_tfc_audience"></a> [aws\_tfc\_audience](#output\_aws\_tfc\_audience) | n/a |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A list of all 'full\_name' values |
| <a name="output_oidc_claims"></a> [oidc\_claims](#output\_oidc\_claims) | OpenID Claims for trust relationship |
| <a name="output_role_arns"></a> [role\_arns](#output\_role\_arns) | ARN for trust relationship role |
<!-- END_TF_DOCS -->
