provider "azurerm" {
  environment                   = "${var.azure_environment}"
  subscription_id               = "${var.azure_subscription_id}"
  client_id                     = "${var.azure_client_id}"
  client_certificate_path       = "${var.client_certificate_path}"
  client_certificate_password   = "${var.client_certificate_password}"
  tenant_id                     = "${var.azure_tenant_id}"
}

resource "azurerm_resource_group" "rg" {
  name     = "Default-ContainerRegistry-EastUS"
  location = "${var.location}"
}

resource "azurerm_container_registry" "acr" {
  name                     = "${var.prefix}registry${var.location_key}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  sku                      = "Basic"
  admin_enabled            = false
}

