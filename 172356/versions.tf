terraform {
  required_version = ">= 1.5.7, < 2.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.12.0, < 7.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.12.0, < 7.0.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "> 5.54.1"
    }
  }
}