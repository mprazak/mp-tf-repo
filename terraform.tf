
##
# Terraform Configuration
##

terraform {

  backend "azurerm" {
    key                  = "github.terraform.tfstate"
  }

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

##
# Providers
##

provider "azurerm" {
  features {}
 subscription_id = "0df6b1b0-29da-4b5a-9354-76cf8b3e5562" #UA
}