output "maintenance_configurations_id" {
  description = "Map of id values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.id }
}
output "maintenance_configurations_in_guest_user_patch_mode" {
  description = "Map of in_guest_user_patch_mode values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.in_guest_user_patch_mode }
}
output "maintenance_configurations_install_patches" {
  description = "Map of install_patches values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.install_patches }
}
output "maintenance_configurations_location" {
  description = "Map of location values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.location }
}
output "maintenance_configurations_name" {
  description = "Map of name values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.name }
}
output "maintenance_configurations_properties" {
  description = "Map of properties values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.properties }
}
output "maintenance_configurations_resource_group_name" {
  description = "Map of resource_group_name values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.resource_group_name }
}
output "maintenance_configurations_scope" {
  description = "Map of scope values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.scope }
}
output "maintenance_configurations_tags" {
  description = "Map of tags values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.tags }
}
output "maintenance_configurations_visibility" {
  description = "Map of visibility values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.visibility }
}
output "maintenance_configurations_window" {
  description = "Map of window values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.window }
}

