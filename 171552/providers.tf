locals {
  eks_module_source = "registry.terraform.io/terraform-aws-modules/eks/aws"
}

module "eks2" {
  source = "git@github.com:registry.terraform.io/terraform-aws-modules/iam/aws"
}

# module "eks" {
#   source = "${local.eks_module_source}"
# }