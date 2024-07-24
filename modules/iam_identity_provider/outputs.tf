output "aws_oidc_tfc_provider_arn" {
  value       = aws_iam_openid_connect_provider.this.arn
  description = "The ARN of the AWS IAM OIDC Identity Provider created for TFC"
}

output "aws_oidc_tfc_provider_client_id_list" {
  value       = aws_iam_openid_connect_provider.this.client_id_list
  description = "The list of client IDs for the AWS IAM OIDC Identity Provider created for TFC"
}
