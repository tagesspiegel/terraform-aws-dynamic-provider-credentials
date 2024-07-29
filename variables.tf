//
// identity provider variables
//

variable "tfc_organization" {
  type        = string
  description = "Name of the organization"
}

variable "tfc_project" {
  type        = string
  description = "Name of the terraform cloud/enterprise project"
}

variable "tfc_aws_audience" {
  type        = string
  description = "AWS audience"
  default     = "aws.workload.identity"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

//
// dynamic credentials roles
//

variable "dynamic_credentials_role_name_override" {
  type        = string
  default     = "terraform-cloud-dynamic-credentials"
  description = "The name of the IAM role to create. If not set, the name will be generated automatically."
}

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

variable "policies" {
  type = set(object({
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
