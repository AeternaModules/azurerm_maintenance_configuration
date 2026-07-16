output "maintenance_configurations_id" {
  description = "Map of id values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "maintenance_configurations_in_guest_user_patch_mode" {
  description = "Map of in_guest_user_patch_mode values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.in_guest_user_patch_mode if v.in_guest_user_patch_mode != null && length(v.in_guest_user_patch_mode) > 0 }
}
output "maintenance_configurations_install_patches" {
  description = "Map of install_patches values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.install_patches if v.install_patches != null && length(v.install_patches) > 0 }
}
output "maintenance_configurations_location" {
  description = "Map of location values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.location if v.location != null && length(v.location) > 0 }
}
output "maintenance_configurations_name" {
  description = "Map of name values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "maintenance_configurations_properties" {
  description = "Map of properties values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.properties if v.properties != null && length(v.properties) > 0 }
}
output "maintenance_configurations_resource_group_name" {
  description = "Map of resource_group_name values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "maintenance_configurations_scope" {
  description = "Map of scope values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.scope if v.scope != null && length(v.scope) > 0 }
}
output "maintenance_configurations_tags" {
  description = "Map of tags values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "maintenance_configurations_visibility" {
  description = "Map of visibility values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.visibility if v.visibility != null && length(v.visibility) > 0 }
}
output "maintenance_configurations_window" {
  description = "Map of window values across all maintenance_configurations, keyed the same as var.maintenance_configurations"
  value       = { for k, v in azurerm_maintenance_configuration.maintenance_configurations : k => v.window if v.window != null && length(v.window) > 0 }
}

