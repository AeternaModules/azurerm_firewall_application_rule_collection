variable "firewall_application_rule_collections" {
  description = <<EOT
Map of firewall_application_rule_collections, attributes below
Required:
    - action
    - azure_firewall_name
    - name
    - priority
    - resource_group_name
    - rule (block):
        - description (optional)
        - fqdn_tags (optional)
        - name (required)
        - protocol (optional, block):
            - port (required)
            - type (required)
        - source_addresses (optional)
        - source_ip_groups (optional)
        - target_fqdns (optional)
EOT

  type = map(object({
    action              = string
    azure_firewall_name = string
    name                = string
    priority            = number
    resource_group_name = string
    rule = list(object({
      description = optional(string)
      fqdn_tags   = optional(list(string))
      name        = string
      protocol = optional(list(object({
        port = number
        type = string
      })))
      source_addresses = optional(list(string))
      source_ip_groups = optional(list(string))
      target_fqdns     = optional(list(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.firewall_application_rule_collections : (
        length(v.rule) >= 1
      )
    ])
    error_message = "Each rule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewall_application_rule_collections : (
        alltrue([for item in v.rule : (item.protocol == null || (length(item.protocol) >= 1))])
      )
    ])
    error_message = "Each protocol list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewall_application_rule_collections : (
        v.priority >= 100 && v.priority <= 65000
      )
    ])
    error_message = "must be between 100 and 65000"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_firewall_application_rule_collection's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from firewallValidate.FirewallName] !matched
  # path: azure_firewall_name
  #   source:    [from firewallValidate.FirewallName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: rule.name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: rule.protocol.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: rule.protocol.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

