output "environment" {
  value = {
    environment_id          = confluent_environment.env.id
    environment_name        = confluent_environment.env.display_name
    schema_registry_id      = data.confluent_schema_registry_cluster.sr.id
  }
}
// Service Account API/KEY
output schema_registry_api_key {
  value = confluent_api_key.env_manager_schema_registry_api_key
  sensitive = true
}