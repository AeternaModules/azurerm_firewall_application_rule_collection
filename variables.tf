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
    rule = object({
      description = optional(string)
      fqdn_tags   = optional(list(string))
      name        = string
      protocol = optional(object({
        port = number
        type = string
      }))
      source_addresses = optional(list(string))
      source_ip_groups = optional(list(string))
      target_fqdns     = optional(list(string))
    })
  }))
}

