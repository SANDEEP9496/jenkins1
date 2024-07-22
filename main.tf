provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"  # Ensure location is enclosed in quotes
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc1208"  # Must be globally unique
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_role_definition" "example" {
    name        = "example_role"
    scope       = data.azurerm_subscription.primary.id
    description = "Example role"
    
    permissions {
        actions   = ["*"]
        not_actions = []
    }
}

resource "azurerm_policy_definition" "example" {
    name         = "example_policy"
    policy_type   = "Custom"
    mode          = "All"
    display_name  = "Example Policy"
    description   = "Example policy description"

    policy_rule = <<POLICY
    {
        "if": {
            "field": "location",
            "equals": "eastus"
        },
        "then": {
            "effect": "deny"
        }
    }
    POLICY
}
