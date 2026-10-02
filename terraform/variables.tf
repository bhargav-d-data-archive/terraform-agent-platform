variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod."
  }
}

variable "service_name" {
  description = "Base name for the Cloud Run service"
  type        = string
  default     = "terraform-agent-platform"
}

variable "container_image" {
  description = "Container image deployed to Cloud Run"
  type        = string
}
