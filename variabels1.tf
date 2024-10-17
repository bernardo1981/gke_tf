variable "project-id" {
  type        = "string"
  description = "GCP project ID"
  default     = "gcp-project-id"
}

variable "region" {
  type        = "string"
  description = "GCP region for resources"
  default     = "europe-west1"
}