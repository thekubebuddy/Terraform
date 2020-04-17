provider "google" {
  version     = "3.5.0"
  credentials = file(".json")
  project     = ""
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

// It creates a gcs bucket
terraform {
  backend "gcs" {
    bucket = "tf-state-prod"
    prefix = "terraform/state"
  }
}
