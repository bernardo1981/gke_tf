variable "project-id" {
  type          = "string"
  description   = "Project ID for GCP"
  default       = "Proyect"
}

variable "region" {
  type          = "string"
  description   = "GCP region"
  default       = "region"
}

variable "gke-name" {
  type          = "string"
  description   = "Name for GKE cluster"
  default       = "kubernetes-cluster"
}

variable "description" {
  type          = "string"
  description   = "description"
  default       = "Managed by Terraform"
}

variable "gke-version" {
  type          = "string"
  description   = "Version for GKE custer"
  default       = "1.11.6-gke.6"
}

variable "gke-zone" {
  type          = "string"
  description   = "Zone for GKE cluster"
  default       = "europe-west1-b"
}

variable "gke-additional-zones" {
  type          = "string"
  description   = "Additional Zones for GKE cluster"
  default       = "europe-west1-c"
}

variable "gke-node-pool-name" {
  type          = "string"
  description   = "GKE Node Pool Name"
  default       = "primary-pool"
}
variable "gke-initial-node-count" {
  type          = "string"
  description   = "GKE Initial node conunt per zone"
  default       = "2"
}

variable "gke-node-disk-size" {
  type          = "string"
  description   = "GKE Node disk size"
  default       = "100"
}

variable "gke-node-disk-type" {
  type          = "string"
  description   = "GKE Node disk type"
  default       = "pd-standard"
}

variable "gke-node-image" {
  type          = "string"
  description   = "GKE Node disk Operative System"
  default       = "COS"
}

variable "gke-node-machine-type" {
  type          = "string"
  description   = "GKE Node type"
  default       = "n1-standard-2"
}

variable "gke-node-preemtible-enabled" {
  type          = "string"
  description   = "GKE Node preemtible enabled"
  default       = "false"
}

variable "project_name" {
  type          = "string"
  description   = "Stage for GKE resources"
  default       = "kubernetes-project"
}

variable "stages" {
  type          = "string"
  description   = "Stage for GKE resources"
  default       = "production"
}

variable "gke-autoscaling-min" {
  type          = "string"
  description   = "Min GKE nodes"
  default       = "4"
}

variable "gke-autoscaling-max" {
  type          = "string"
  description   = "Max GKE nodes"
  default       = "6"
}

variable "gke-node-auto-repair-enabled" {
  type          = "string"
  description   = "Enable auto-repair in GKE nodes"
  default       = "true"
}

variable "gke-node-auto-upgrade-enabled" {
  type          = "string"
  description   = "Enable auto-upgrade in GKE nodes"
  default       = "true"
}

variable "gke-node-lb-disabled" {
  type          = "string"
  description   = "Disable LB in GKE nodes"
  default       = "true"
}

variable "gke-node-pods-autoscaling-disabled" {
  type          = "string"
  description   = "Disable autoscaling pods in GKE nodes"
  default       = "true"
}

variable "gke-node-dashboard-disabled" {
  type          = "string"
  description   = "Disable dashboard in GKE nodes"
  default       = "true"
}

variable "gke-node-network-policy-disabled" {
  type          = "string"
  description   = "Disable Network Policy in GKE nodes"
  default       = "true"
}