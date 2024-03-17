terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }
  } /*
  backend "azurerm" {
    resource_group_name  = "TerraRG1"
    storage_account_name = "terrasa13tier"
    container_name       = "statefile"
    key                  = "POC.terraform.tfstate"
  }*/
}

provider "azurerm" {
  features {}
}