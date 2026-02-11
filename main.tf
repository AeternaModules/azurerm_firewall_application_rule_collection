resource "azurerm_firewall_application_rule_collection" "firewall_application_rule_collections" {
  for_each = var.firewall_application_rule_collections

  action              = each.value.action
  azure_firewall_name = each.value.azure_firewall_name
  name                = each.value.name
  priority            = each.value.priority
  resource_group_name = each.value.resource_group_name

  dynamic "rule" {
    for_each = each.value.rule
    content {
      description = rule.value.description
      fqdn_tags   = rule.value.fqdn_tags
      name        = rule.value.name
      dynamic "protocol" {
        for_each = rule.value.protocol != null ? rule.value.protocol : []
        content {
          port = protocol.value.port
          type = protocol.value.type
        }
      }
      source_addresses = rule.value.source_addresses
      source_ip_groups = rule.value.source_ip_groups
      target_fqdns     = rule.value.target_fqdns
    }
  }
}

