module "registry_full" {
  source = "registry.terraform.io/terraform-aws-modules/vpc/aws"
}

module "registry_full_module" {
  source = "registry.terraform.io/terraform-aws-modules/vpc/aws///modules/vpc-endpoints"
}

locals {
  iam_module_source = "registry.terraform.io/terraform-aws-modules/iam/aws"
}
locals {
  iam_module_version = "5.43.0"
}


module "iam" {
  source = "${local.iam_module_source}"
  version = "${local.iam_module_version}"
}