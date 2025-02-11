terraform {
  required_providers {
    artifactory = {
      source  = "jfrog/artifactory"
      version = "12.3.3"
    }
  }
}

variable "artifactory_url" {
  description = "The base URL of the Artifactory deployment"
  type        = string
}
variable "artifactory_username" {
  description = "The username for the Artifactory administrator"
  type        = string
}
variable "artifactory_password" {
  description = "The password for the Artifactory administrator"
  type        = string
}
variable "artifactory_token" {
  description = "The token for the Artifactory administrator"
  type        = string
}
# Configure the xray provider
provider "artifactory" {
  url          = var.artifactory_url
  access_token = var.artifactory_token
}

resource "artifactory_release_bundle_v2" "my-release-bundle-v2-aql" {
  name = "my-release-bundle-v2-aql"
  version = "1.0.0"
  keypair_name = "dhanush"
  skip_docker_manifest_resolution = true
  source_type = "aql"

  source = {
    aql = "items.find({\"$and\" : [{\"repo\": {\"$match\": \"TCPL-Android-Local-DEV\"}}, {\"name\": {\"$match\": \"*.*\"}}]})"
  }
}


