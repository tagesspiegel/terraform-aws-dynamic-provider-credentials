// get tls certificate from tfc
data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

// create AWS IAM OIDC Identity Provider
resource "aws_iam_openid_connect_provider" "this" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [var.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}
