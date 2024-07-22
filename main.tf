provider "azurerm" {
  features {}
}

resource "resourcegroupname" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc"  # Must be globally unique
  resource_group_name      = resourcegroupname
  location                 = East US
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
