terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "custom-org"
    workspaces {
      name = "custom-ws"
    }
  }
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
    aws = {
      source = "registry.opentofu.org/hashicorp/aws"
    }
    hashicups = {
      source  = "app.terraform.io/custom-org/hashicups"
      version = "0.2.3"
    }
  }

}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket"
}

provider "hashicups" {}

data "hashicups_coffees" "all" {}

resource "hashicups_order" "order" {
  items {}
}
