resource "azurerm_firewall_application_rule_collection" "firewall_application_rule_collections" {
  for_each = var.firewall_application_rule_collections

  action              = each.value.action
  azure_firewall_name = each.value.azure_firewall_name
  name                = each.value.name
  priority            = each.value.priority
  resource_group_name = each.value.resource_group_name

  rule {
    description = each.value.rule.description
    fqdn_tags   = each.value.rule.fqdn_tags
    name        = each.value.rule.name
    dynamic "protocol" {
      for_each = each.value.rule.protocol != null ? [each.value.rule.protocol] : []
      content {
        port = protocol.value.port
        type = protocol.value.type
      }
    }
    source_addresses = each.value.rule.source_addresses
    source_ip_groups = each.value.rule.source_ip_groups
    target_fqdns     = each.value.rule.target_fqdns
  }
}

