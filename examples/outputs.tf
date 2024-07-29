output "full_name" {
  value = module.tfc_aws_dynamic_credentials.full_name
}

output "oidc_claims" {
  value = module.tfc_aws_dynamic_credentials.oidc_claims
}

output "role_arns" {
  value = module.tfc_aws_dynamic_credentials.role_arns
}

output "aws_tfc_audience" {
  value     = module.tfc_aws_dynamic_credentials.aws_tfc_audience
  sensitive = true
}
