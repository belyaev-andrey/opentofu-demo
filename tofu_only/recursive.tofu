locals {
  module_source = local.module_source
}

module "test" {
  source = local.module_source
  variable = "test"
}
