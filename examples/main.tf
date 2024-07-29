provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  token      = var.AWS_SESSION_TOKEN
}

module "tfc_aws_dynamic_credentials" {
  source           = "../"
  tfc_hostname     = "app.terraform.io"
  tfc_aws_audience = "app.terraform.io"
  tfc_organization = var.TFC_ORGANIZATION
  tfc_project      = var.TFC_PROJECT_NAME
  statements = [
    {
      org_name     = var.TFC_ORGANIZATION
      project_name = var.TFC_PROJECT_NAME
      run_phase    = "*"
      workspace    = "*"
    },
    {
      org_name     = var.TFC_ORGANIZATION
      project_name = var.TFC_PROJECT_NAME
      run_phase    = "*"
      workspace    = "hello-world"
    },
  ]
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
        "s3:*"
      ]
      Resource = "*"
    },
    {
      Effect = "Allow"
      Action = [
        "iam:*"
      ]
      Resource = "*"
    }
  ]
}
