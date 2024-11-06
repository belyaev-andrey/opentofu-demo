provider "docker" {
  ca_material = "asd"
}

resource "aws_ec2_host" "host" {
  availability_zone = "us-west-2a"
  instance_type = "t2.medium"
}

module "registry_short" {
  source = "terraform-aws-modules/vpc/aws"
  azs = ["us-west-2a"]
}

resource "aws_ec2_host" "host3" {
  availability_zone = module.registry_short.azs
}

# module "unresolved" {
#   source = "git::ssh://git@github.com/not-found"
# }
