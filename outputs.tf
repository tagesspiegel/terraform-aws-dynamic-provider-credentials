output "full_name" {
  value       = module.aws_tfc_dynamic_credentials_iam_roles.full_name
  description = "A list of all 'full_name' values"
}

output "oidc_claims" {
  value       = module.aws_tfc_dynamic_credentials_iam_roles.openid_claims
  description = "OpenID Claims for trust relationship"
}

output "role_arns" {
  value       = module.aws_tfc_dynamic_credentials_iam_roles.role_arn
  description = "ARN for trust relationship role"
}

output "aws_tfc_audience" {
  value     = module.aws_identity_provider.aws_tfc_audience
  sensitive = true
}
