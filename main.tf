terraform {
  backend "gcs" {
    bucket  = "terraform-kubernetes"
    prefix  = "production/terraform.tfstate"
  }
}