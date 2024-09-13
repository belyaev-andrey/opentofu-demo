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

resource "aws_ec2_host" "sd" {
  availability_zone = ""
}