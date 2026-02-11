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
}

