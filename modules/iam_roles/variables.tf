variable "aws_iam_role_name_override" {
  type        = string
  default     = ""
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

variable "tfc_organization_name" {
  type        = string
  default     = "Tagesspiegel"
  description = "The name of the TFC or TFE organization you'd like to use with AWS"
}

variable "tfc_project_name" {
  type        = string
  description = "The name of the TFC or TFE project you'd like to use with AWS"
}

variable "tfc_workspace_name" {
  type        = string
  description = "The name of the TFC or TFE workspace you'd like to use with AWS"
}

variable "tfc_run_phase" {
  type        = string
  description = "The run phase to use for the trust relationship"
  default     = "*"
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
