variable "aws_iam_role_name_override" {
  type        = string
  default     = "terraform-cloud-dynamic-credentials"
  description = "The name of the IAM role to create. If not set, the name will be generated automatically."
}

variable "tfc_oidc_provider_arn" {
  type        = string
  description = "The ARN of the OIDC provider to use for TFC"
}

variable "tfc_oidc_provider_client_id_list" {
  type        = list(string)
  description = "The list of client IDs to use for TFC"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

// role statement configuration

variable "statements" {
  type = set(object({
    org_name     = string
    project_name = string
    workspace    = string
    run_phase    = string
  }))
  description = "The list of statements to use for the trust relationship"
  validation {
    condition     = length(var.statements) > 0
    error_message = "At least one statement must be provided"
  }
}

variable "aws_iam_custom_policies" {
  type = list(object({
    Effect   = string
    Action   = list(string)
    Resource = string
  }))
  default = [
    {
      Effect = "Allow"
      Action = [
        "ec2:*"
      ]
      Resource = "*"
    }
  ]
  description = "A list of custom policies to attach to the IAM role. By default the provider will be allowed to perform all actions on all ec2 resources."
}
