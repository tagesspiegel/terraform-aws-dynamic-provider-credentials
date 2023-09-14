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
