output "full_names" {
  value       = [for instance in module.aws_tfc_dynamic_credentials_iam_roles : instance.full_name]
  description = "A list of all 'full_name' values"
}

output "oidc_claims" {
  value       = { for instance in module.aws_tfc_dynamic_credentials_iam_roles : instance.full_name => instance.openid_claims }
  description = "A map of 'full_name' as key and 'openid_claims' as value"
}

output "role_arns" {
  value       = { for instance in module.aws_tfc_dynamic_credentials_iam_roles : instance.full_name => instance.role_arn }
  description = "A map of 'full_name' as key and 'role_arn' as value"
}
