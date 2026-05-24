terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  cloud {
    organization = "Optum_Test"

    workspaces {
      name = "dev"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
variable "project_id" {
  type    = string
  default = "sbs-kaf-int-01"
}

variable "region" {
  type    = string
  default = "us-central1-a"
}
resource "google_container_cluster" "mycluster" {
  name               = "mycluster"
  location           = var.region
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
  }
}
