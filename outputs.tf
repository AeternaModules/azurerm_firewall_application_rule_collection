output "firewall_application_rule_collections" {
  description = "All firewall_application_rule_collection resources"
  value       = azurerm_firewall_application_rule_collection.firewall_application_rule_collections
}
output "firewall_application_rule_collections_action" {
  description = "List of action values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.action]
}
output "firewall_application_rule_collections_azure_firewall_name" {
  description = "List of azure_firewall_name values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.azure_firewall_name]
}
output "firewall_application_rule_collections_name" {
  description = "List of name values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.name]
}
output "firewall_application_rule_collections_priority" {
  description = "List of priority values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.priority]
}
output "firewall_application_rule_collections_resource_group_name" {
  description = "List of resource_group_name values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.resource_group_name]
}
output "firewall_application_rule_collections_rule" {
  description = "List of rule values across all firewall_application_rule_collections"
  value       = [for k, v in azurerm_firewall_application_rule_collection.firewall_application_rule_collections : v.rule]
}

