terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "docker" {
  ca_material = ";sd"

}

resource "aws_ec2_host" "host" {
  availability_zone = "us-west-2a"
  instance_type = "t2.medium"
}

module "registry_short" {
  source = "terraform-aws-modules/vpc/aws"
}

# module "unresolved" {
#   source = "git::ssh://git@github.com/not-found"
# }
