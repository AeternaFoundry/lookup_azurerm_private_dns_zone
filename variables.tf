variable "private_dns_zone_lookup" {
  description = <<EOT
Map of private_dns_zone_lookup, attributes below
Required:
    - name
Optional:
    - resource_group_name
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = optional(string)
    tags                = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.private_dns_zone_lookup : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

