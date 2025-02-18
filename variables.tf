variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "project" {
  description = "The project in which resources will be created"
  type        = string
}

variable "org" {
  description = "The organization associated with the project"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for the VM"
  type        = string
  default     = "us-central1-a"
}
variable "default_provisioner_version" {
  description = "The default version of the provisioner to use"
  type        = string
}

variable "default_cost_estimation_enabled" {
  description = "Enable or disable cost estimation"
  type        = bool
}
variable "account_id" {
  description = "The Harness account ID"
  type        = string
}
