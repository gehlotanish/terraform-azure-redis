
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project-name | Name of the project, appended to name of resouce. "stor${var.medline_default_location}${var.environment}${var.project-name}" | `string` | n/a | yes |
| azure_resource_group_name | Name of resource group to deploy storage | `string` | n/a | yes |
| enviroment | Specifies the Azure environment (sbx/dev/tst/prd). | `string` | n/a | yes |
| capacity | Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4) `https://azure.microsoft.com/en-in/pricing/details/cache/`  | `numeric` | n/a | yes | 
| sku_name | Redis Cache Sku name. Can be Basic, Standard or Premium | `string` | Standard | yes | 
| public_network_access_enabled | true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. Defaults to true | `bool` | true | no | 
| enable_non_ssl_port | Enable the non-SSL port (6379) - disabled by default. | `bool` | false | no | 
| enable_authentication | If set to false, the Redis instance will be accessible without authentication. Defaults to true | `bool` | false | no |
| maxmemory_policy | How Redis will select what to remove when maxmemory is reached.` volatile-lru` - The default eviction policy.`allkeys-lru` `volatile-random` `allkeys-random` `volatile-ttl` `noeviction` | `string` | volatile-lru | no |
| aof_backup_enabled | Enable or disable AOF persistence for this Redis Cache. Required in `Premium` Plan  | `bool` | false | no |
| aof_storage_connection_string_0 | First Storage Account connection string for AOF persistence. Work on aof_backup_enabled = `true`. Eg. aof_storage_connection_string_0 = "DefaultEndpointsProtocol=https;BlobEndpoint=${primary_blob_endpoint};AccountName=${mystorageaccount.name};AccountKey=${primary_access_key}" | `string` | n/a | no |
| aof_storage_connection_string_1 | Second Storage Account connection string for AOF persistence. Work on aof_backup_enabled = `true` | `string` | n/a | no | 
| extra_redis_tags | Additional tags to add in locals | `map(string)` | n/a | yes |
