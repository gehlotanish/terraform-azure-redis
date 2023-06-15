provider "azurerm" {
  features {}
}

resource "azurerm_redis_cache" "example" {
  name                          = var.redis_name
  resource_group_name           = data.azurerm_resource_group.example.name
  location                      = data.azurerm_resource_group.example.location
  family                        = lookup(local.redis_family_map, var.sku_name)
  sku_name                      = var.sku_name
  capacity                      = var.capacity
  enable_non_ssl_port           = var.enable_non_ssl_port
  minimum_tls_version           = var.minimum_tls_version
  shard_count                   = var.sku_name == "Premium" ? var.cluster_shard_count : 0
  public_network_access_enabled = var.public_network_access_enabled

  tags = merge(local.default_tags, var.extra_redis_tags)

  redis_configuration {
    enable_authentication           = var.enable_authentication
    maxmemory_policy                = var.maxmemory_policy
    aof_backup_enabled              = var.sku_name == "Premium" ? var.aof_backup_enabled : false
    aof_storage_connection_string_0 = var.aof_backup_enabled == true ? var.aof_storage_connection_string_0 : ""
    aof_storage_connection_string_1 = var.aof_backup_enabled == true ? var.aof_storage_connection_string_1 : ""
  }
}

resource "azurerm_management_lock" "lock" {
  count      = var.environment == "prod" ? 1 : 0
  name       = "resource-redis-lock"
  scope      = azurerm_redis_cache.example.id
  lock_level = "CanNotDelete"
  notes      = "Resource is locked, Contact Administrator For Support."
}
