# Configure the Confluent Cloud Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">=2.50.0"
    }
  } 
  required_version = ">= 1.13.4"
}