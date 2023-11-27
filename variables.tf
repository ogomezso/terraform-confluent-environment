# Confluent Cloud Credentials  

variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "display_name" {
  type        = string
  description = "Environment human readable name"
}

variable "cloud_provider" {
  type        = string
  description = "Cloud Provider for Schema Registry Cluster (AWS, AZURE, GCP)"
  validation {
    condition = (
      contains(["AWS", "AZURE", "GCP"], var.cloud_provider)
    )
    error_message = <<EOT
cloud_provider => AWS, AZURE, GCP
    EOT
  }
}
variable "region" {
  type        = string
  description = "Region for Schema Registry Package"
}

variable "sr_package" {
  type    = string
  default = "ESSENTIALS"
  validation {
    condition = (
      contains(["ESSENTIALS", "ADVANCED"], var.sr_package)
    )
    error_message = <<EOT
sr_package => ESSENTIALS, ADVANCED
    EOT
  }
}
