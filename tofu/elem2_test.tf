variable "instance_types2" {
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.medium", "t2.large"]
}

variable "index2" {
  type        = number
  default     = 2
}

locals {
  # Custom-like 'element2' function logic using a conditional expression
  element2 = var.index2 >= 0 && var.index2 < length(var.instance_types2) ? var.instance_types2[var.index2] : "index out of range"
}

output "selected_instance_type2" {
  description = "The selected instance type from the list using custom element2 function"
  value       = local.element2
}
