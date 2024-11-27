resource "aws_ec2_host" "host2" {
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"
}

resource "docker_image" "ww2" {
  name = "ubuntu:precise"
}