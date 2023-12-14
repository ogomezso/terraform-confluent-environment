output "environment" {
  value = {
    environment_id   = confluent_environment.env.display_name
    environemnt_name = confluent_environment.env.id
  }
}
