// get tls certificate from tfc
data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

// generate two random strings to use as audience
resource "random_string" "sfx1" {
  length  = 5
  special = false
  upper   = false
}
resource "random_string" "sfx2" {
  length  = 3
  special = false
  upper   = false
}

// create AWS IAM OIDC Identity Provider
resource "aws_iam_openid_connect_provider" "this" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = [var.tfc_aws_audience]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]
}
