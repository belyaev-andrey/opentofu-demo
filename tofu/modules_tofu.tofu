module "registry_full" { 
  source = "registry.terraform.io/terraform-aws-modules/vpc/aws"
}

module "registry_full_module" {
  source = "registry.terraform.io/terraform-aws-modules/vpc/aws///modules/vpc-endpoints"
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name = "cluster_name"
  cluster_version = "10.1"

  cluster_addons = {
    coredns = {
      most_recent = true
    }
  }
}

locals {
  src2 = "${local.iam_module_source}"
}

locals {
  src3 = local.iam_module_source
}

locals {
  iam_module_source = "terraform-aws-modules/iam/aws///modules/iam-account"
}

module "iam" {
  source = local.src2
  account_alias = ""
}

module "iam2" {
  source = "${local.iam_module_source}"
  account_alias = ""
}

module "iam3" {
  source = "${local.src2}"
  account_alias = ""
}

module "iam4" {
  source = local.iam_module_source
  account_alias = ""
}

module "iam5" {
  source = "${local.src3}"
  account_alias = ""
}

module "iam6" {
  source = local.src3
  account_alias = ""
}