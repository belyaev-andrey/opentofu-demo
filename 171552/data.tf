output "selected_instance_type2" {
  description = "The selected instance type from the list using custom element2 function"
  value       = element(["a", "b", "c"], length(["a", "b", "c"])-1)
}

