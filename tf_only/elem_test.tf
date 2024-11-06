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
  }

}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket"
}