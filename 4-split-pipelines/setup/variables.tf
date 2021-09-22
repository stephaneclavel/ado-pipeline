variable "ado_org_service_url" {
  type        = string
  description = "Org service url for Azure DevOps"
  default     = "https://dev.azure.com/decidela"
}

variable "ado_github_repo" {
  type        = string
  description = "Name of the repository in the format <GitHub Org>/<RepoName>"
  default     = "stephaneclavel/ado-pipeline"
}

variable "ado_pipeline_yaml_paths" {
  type        = map(string)
  description = "Path to the yaml for the pipelines"
  default = {
    ci    = "4-split-pipelines/vnet/azure-pipeline-ci.yaml"
    merge = "4-split-pipelines/vnet/azure-pipeline-merge.yaml"
  }
}

variable "ado_github_pat" {
  type        = string
  description = "Personal authentication token for GitHub repo"
  sensitive   = true
}

variable "ado_terraform_version" {
  type        = string
  description = "Version of Terraform to use in the pipeline"
  default     = "1.0.4"
}

variable "prefix" {
  type        = string
  description = "Naming prefix for resources"
  default     = "adopipeline4setup"
}

variable "az_location" {
  type    = string
  default = "westeurope"
}

variable "az_container_name" {
  type        = string
  description = "Name of container on storage account for Terraform state"
  default     = "ado-pipeline-4"
}

variable "az_state_key" {
  type        = string
  description = "Name of key in storage account for Terraform state"
  default     = "4-split-pipelines.tfstate"
}

variable "az_client_id" {
  type        = string
  description = "Client ID with permissions to create resources in Azure, use env variables"
}

variable "az_client_secret" {
  type        = string
  description = "Client secret with permissions to create resources in Azure, use env variables"
  sensitive   = true
}

variable "az_subscription" {
  type        = string
  description = "Client ID subscription, use env variables"
}

variable "az_tenant" {
  type        = string
  description = "Client ID Azure AD tenant, use env variables"
}

variable "CLIENT_ID" {
  type        = string
  description = "SP used to provision setup resources and create ADO AZRM endpoint, use env variables"
}

variable "CLIENT_SECRET" {
  type        = string
  description = "SP used to provision setup resources and create ADO AZRM endpoint, use env variables"
  sensitive   = true
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

locals {
  ado_project_name        = "${var.prefix}-project-${random_integer.suffix.result}"
  ado_project_description = "Project for ${var.prefix}"
  ado_project_visibility  = "private"
  ado_pipeline_name_1     = "${var.prefix}-pipeline-2"

  az_resource_group_name  = "${var.prefix}${random_integer.suffix.result}"
  az_storage_account_name = "${lower(var.prefix)}${random_integer.suffix.result}"
  az_key_vault_name       = "${var.prefix}${random_integer.suffix.result}"

  pipeline_variables = {
    storageaccount   = azurerm_storage_account.sa.name
    container-name   = var.az_container_name
    key              = var.az_state_key
    sas-token        = data.azurerm_storage_account_sas.state.sas
    az-client-id     = var.az_client_id
    az-client-secret = var.az_client_secret
    az-subscription  = var.az_subscription
    az-tenant        = var.az_tenant
  }

  azad_service_connection_sp_name = "${var.prefix}-service-connection-${random_integer.suffix.result}"
  azad_resource_creation_sp_name  = "${var.prefix}-resource-creation-${random_integer.suffix.result}"
}
