# Confluent Cloud Environment Module

Terraform module for Confluent Cloud Environment creation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.42.0 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >=1.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_confluent"></a> [confluent](#provider\_confluent) | >=1.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [confluent_environment.env](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/environment) | resource |
| [confluent_schema_registry_cluster.sr](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/schema_registry_cluster) | resource |
| [confluent_schema_registry_region.sr_region](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/data-sources/schema_registry_region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | Cloud Provider for Schema Registry Cluster (AWS, AZURE, GCP) | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Environment human readable name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for Schema Registry Package | `string` | n/a | yes |
| <a name="input_sr_package"></a> [sr\_package](#input\_sr\_package) | n/a | `string` | `"BASIC"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_env"></a> [env](#output\_env) | n/a |
<!-- END_TF_DOCS -->