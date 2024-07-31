variable "TFC_ORGANIZATION" {
  description = "The name of the Terraform Cloud organization"
  default     = "my-organization"
}

variable "TFC_PROJECT_NAME" {
  description = "The name of the Terraform Cloud project"
  default     = "my-project"
}

variable "AWS_REGION" {
  description = "The AWS zone to use for the resources"
  default     = "eu-central-1"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret key"
  sensitive   = true
}

variable "AWS_SESSION_TOKEN" {
  description = "The AWS session token"
  sensitive   = true
}
