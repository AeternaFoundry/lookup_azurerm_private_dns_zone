data "azurerm_private_dns_zone" "private_dns_zone_lookup" {
  for_each = var.private_dns_zone_lookup

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}

