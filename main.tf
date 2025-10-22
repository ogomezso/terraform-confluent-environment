resource "confluent_environment" "env" {
  display_name = var.display_name

  stream_governance {
    package = var.sr_package
  }
}

data "confluent_schema_registry_cluster" "sr" {
  environment {
    id = confluent_environment.env.id
  }
}

data "confluent_service_account" "env_manager_sa" {
   count       = var.env_manager_sa != null ? 1 : 0
   display_name = var.env_manager_sa
}

resource "confluent_api_key" "env_manager_schema_registry_api_key" {
  count       = var.env_manager_sa != null ? 1 : 0
  display_name = "schema-registry-api-key"
  description  = "Schema Registry API Key that is owned by ${var.env_manager_sa} service account"
  owner {
    id          = data.confluent_service_account.env_manager_sa[0].id
    api_version = data.confluent_service_account.env_manager_sa[0].api_version
    kind        = data.confluent_service_account.env_manager_sa[0].kind
  }

  managed_resource {
    id          = data.confluent_schema_registry_cluster.sr.id
    api_version = data.confluent_schema_registry_cluster.sr.api_version
    kind        = data.confluent_schema_registry_cluster.sr.kind

    environment {
      id = confluent_environment.env.id
    }
  }
}