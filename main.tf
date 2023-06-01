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
    id = confluent_environment.main.id
  }

  region {
    id = data.confluent_schema_registry_region.sr_region.id
  }
}