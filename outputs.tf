output "firewall_application_rule_collections_id" {
  description = "Map of id values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "firewall_application_rule_collections_action" {
  description = "Map of action values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.action if v.action != null && length(v.action) > 0 }
}
output "firewall_application_rule_collections_azure_firewall_name" {
  description = "Map of azure_firewall_name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.azure_firewall_name if v.azure_firewall_name != null && length(v.azure_firewall_name) > 0 }
}
output "firewall_application_rule_collections_name" {
  description = "Map of name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "firewall_application_rule_collections_priority" {
  description = "Map of priority values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.priority if v.priority != null }
}
output "firewall_application_rule_collections_resource_group_name" {
  description = "Map of resource_group_name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "firewall_application_rule_collections_rule" {
  description = "Map of rule values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.rule if v.rule != null && length(v.rule) > 0 }
}

