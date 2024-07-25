//
// identity provider variables
//

variable "tfc_organization" {
  type        = string
  description = "Name of the organization"
}

variable "tfc_aws_audience" {
  type        = string
  description = "AWS audience"
  default     = "aws.workload.identity"
}

//
// dynamic credentials roles
//

variable "tfc_workspaces" {
  type = list(object({
    name_override = string
    workspace     = string
    run_phase     = string
    policies = list(object({
      Effect   = string
      Action   = list(string)
      Resource = string
    }))
  }))
  description = "List of workspaces to create IAM roles for"
}

variable "tfc_project" {
  type        = string
  description = "Name of the terraform cloud/enterprise project"
}
