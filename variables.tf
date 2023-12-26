# Confluent Cloud Credentials  

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

variable "env_manager_sa" {
  type        = string
  description = "Env Manager Service Account"
  default = null
}
