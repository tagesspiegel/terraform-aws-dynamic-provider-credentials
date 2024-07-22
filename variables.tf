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

