variable "redis_name" {
  type = string
}

variable "environment" {
  description = "Name of the application's environnement"
  type        = string
}

variable "azure_resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
  type        = string
}

variable "capacity" {
  description = "Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4)  https://docs.microsoft.com/fr-fr/azure/redis-cache/cache-how-to-premium-clustering"
  type        = number
  default     = 0
}

variable "sku_name" {
  description = "Redis Cache Sku name. Can be Basic, Standard or Premium"
  type        = string
  default     = "Standard"
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

variable "extra_redis_tags" {
  type        = map(string)
  default     = {}
  description = "List of extra tags"
}

variable "cluster_shard_count" {
  description = "Number of cluster shards desired"
  type        = number
  default     = 2
}

variable "enable_non_ssl_port" {
  description = "Enable NON SSL PORT"
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  type    = number
  default = 1.2
}

variable "enable_authentication" {
  type    = bool
  default = true
}

variable "maxmemory_policy" {
  type    = string
  default = "volatile-lru"
}

variable "aof_backup_enabled" {
  type    = bool
  default = false
}

variable "aof_storage_connection_string_0" {
  type    = string
  default = "0"
}

variable "aof_storage_connection_string_1" {
  type    = string
  default = "0"
}

