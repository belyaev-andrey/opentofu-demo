variable "instance_types" {
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.medium", "t2.large"]
}

variable "index" {
  type        = number
  default     = 2
}

output "selected_instance_type" {
  description = "The selected instance type from the list"
  value       = element(var.instance_types, var.index)
}
