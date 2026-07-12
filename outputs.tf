output "firewall_application_rule_collections_action" {
  description = "Map of action values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.action }
}
output "firewall_application_rule_collections_azure_firewall_name" {
  description = "Map of azure_firewall_name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.azure_firewall_name }
}
output "firewall_application_rule_collections_name" {
  description = "Map of name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.name }
}
output "firewall_application_rule_collections_priority" {
  description = "Map of priority values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.priority }
}
output "firewall_application_rule_collections_resource_group_name" {
  description = "Map of resource_group_name values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.resource_group_name }
}
output "firewall_application_rule_collections_rule" {
  description = "Map of rule values across all firewall_application_rule_collections, keyed the same as var.firewall_application_rule_collections"
  value       = { for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : k => v.rule }
}

