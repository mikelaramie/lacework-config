terraform {
  required_providers {
    lacework = {
      source  = "lacework/lacework"
      //version = "~> 0.2.5"
    }
  }
}

provider "google" {
    project = var.gcp_project_id 
    region  = var.gcp_region
    zone    = var.gcp_zone
}

provider "lacework" {
    account     = var.lacework_account
    api_key     = var.lacework_api_key
    api_secret  = var.lacework_api_secret
}