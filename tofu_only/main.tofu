terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "custom-org"
    workspaces {
      name = "custom-ws"
    }
  }
}

resource "docker_image" "img" {
  name = ""
}

resource "aws_ec2_host" "sd" {
  availability_zone = ""
}

