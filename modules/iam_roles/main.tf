resource "aws_iam_role" "this" {
  name = var.aws_iam_role_name_override
  assume_role_policy = templatefile("${path.module}/files/aws_iam_role_template.json", {
    statements            = var.statements
    audience              = one(var.tfc_oidc_provider_client_id_list)
    tfc_oidc_provider_arn = var.tfc_oidc_provider_arn
    tfc_hostname          = var.tfc_hostname
  })

  inline_policy {
    name   = "tfc"
    policy = jsonencode({
      Version   = "2012-10-17"
      Statement = var.aws_iam_custom_policies
    })
  }
}
