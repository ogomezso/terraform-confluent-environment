resource "confluent_environment" "env" {
  display_name = var.display_name
}

data "confluent_schema_registry_region" "sr_region" {
  cloud   = var.cloud_provider
  region  = var.region
  package = var.sr_package
}

resource "confluent_schema_registry_cluster" "sr" {
  package = data.confluent_schema_registry_region.sr_region.package

  environment {
    id = confluent_environment.env.id
  }

  region {
    id = data.confluent_schema_registry_region.sr_region.id
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
    id          = confluent_schema_registry_cluster.sr.id
    api_version = confluent_schema_registry_cluster.sr.api_version
    kind        = confluent_schema_registry_cluster.sr.kind

    environment {
      id = confluent_environment.env.id
    }
  }
}