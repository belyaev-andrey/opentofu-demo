terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
resource "aws_ec2_host" "host" {
  availability_zone = "us-west-2a"
}

resource "docker_image" "ww" {
  name = ""
}