output "full_name" {
  description = "A combination of project and workspace name"
  value       = local.full_name
}

output "openid_claims" {
  description = "OpenID Claims for trust relationship"
  value       = one(jsondecode(aws_iam_role.this.assume_role_policy).Statement).Condition
}

output "role_arn" {
  description = "ARN for trust relationship role"
  value       = aws_iam_role.this.arn
}
