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
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "img" {
  name = ""
}

resource "aws_ec2_host" "sd" {
  availability_zone = ""
}

