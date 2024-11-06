variable "var1" {
  default = "123"
  type = string
}

resource "aws_ec2_host" "host1" {
  availability_zone = data.aws_ec2_host.sd3.availability_zone
  id = "id33"
}

data "aws_ec2_host" "sd3" {
  id = aws_ec2_host.host1.id
}