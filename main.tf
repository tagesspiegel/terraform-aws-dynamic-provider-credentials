// import the aws oidc identity provider module
// this module allows us to authenticate from terraform cloud to aws using oidc
module "aws_identity_provider" {
  source           = "./modules/iam_identity_provider"
  tfc_organization = var.tfc_organization
  tfc_hostname     = var.tfc_hostname
}

// aws iam roles that are created to grant permissions to terraform cloud
module "aws_tfc_dynamic_credentials_iam_roles" {
  source = "./modules/iam_roles"

  depends_on = [
    module.aws_identity_provider
  ]

  for_each = { for workspace in var.tfc_workspaces : "${workspace.name_override}" => workspace }

  tfc_organization_name = var.tfc_organization
  tfc_project_name      = var.tfc_project

  tfc_oidc_provider_arn            = module.aws_identity_provider.aws_oidc_tfc_provider_arn
  tfc_oidc_provider_client_id_list = module.aws_identity_provider.aws_oidc_tfc_provider_client_id_list

  aws_iam_role_name_override = each.value.name_override
  tfc_workspace_name         = each.value.workspace
  tfc_run_phase              = each.value.run_phase
  aws_iam_custom_policies    = each.value.policies
}

// create a variable set
resource "tfe_variable_set" "tfc_aws_dynamic_credentials" {
  name         = "aws-dynamic-credentials-${var.tfc_project}"
  description  = "AWS dynamic credentials"
  organization = var.tfc_organization
}

// get the project id
data "tfe_project" "tfc_project" {
  name         = var.tfc_project
  organization = var.tfc_organization
}

// assign the variable set to the project
resource "tfe_project_variable_set" "tfc_project" {
  variable_set_id = tfe_variable_set.tfc_aws_dynamic_credentials.id
  project_id      = data.tfe_project.tfc_project.id
}

// create the variables
resource "tfe_variable" "tfe_aws_provider_auth" {
  key             = "TFC_AWS_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "AWS provider auth"
  variable_set_id = tfe_variable_set.tfc_aws_dynamic_credentials.id
}

resource "tfe_variable" "tfe_aws_provider_auth_arn" {
  key             = "TFC_AWS_RUN_ROLE_ARN"
  value           = module.aws_tfc_dynamic_credentials_iam_roles["${var.tfc_project}-auth"].role_arn
  category        = "env"
  description     = "AWS provider auth"
  variable_set_id = tfe_variable_set.tfc_aws_dynamic_credentials.id
}
