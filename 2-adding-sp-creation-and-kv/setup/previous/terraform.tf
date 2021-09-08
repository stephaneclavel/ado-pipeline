terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"

    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }

  }

  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate250790"
    container_name       = "ado-pipeline"
    key                  = "1-learn.tfstate"
  }

}