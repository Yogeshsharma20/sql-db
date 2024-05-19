

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Test-rg"
    storage_account_name = "devopsinsider01"                      
    container_name       = "tfstate"
    key                  = "sql.terraform.tfstate"                     
  }
}
    
  