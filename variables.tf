variable "maintenance_configurations" {
  description = <<EOT
Map of maintenance_configurations, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scope
Optional:
    - in_guest_user_patch_mode
    - properties
    - tags
    - visibility
    - install_patches (block):
        - linux (optional, block):
            - classifications_to_include (optional)
            - package_names_mask_to_exclude (optional)
            - package_names_mask_to_include (optional)
        - reboot (optional)
        - windows (optional, block):
            - classifications_to_include (optional)
            - kb_numbers_to_exclude (optional)
            - kb_numbers_to_include (optional)
    - window (block):
        - duration (optional)
        - expiration_date_time (optional)
        - recur_every (optional)
        - start_date_time (required)
        - time_zone (required)
EOT

  type = map(object({
    location                 = string
    name                     = string
    resource_group_name      = string
    scope                    = string
    in_guest_user_patch_mode = optional(string)
    properties               = optional(map(string))
    tags                     = optional(map(string))
    visibility               = optional(string)
    install_patches = optional(object({
      linux = optional(list(object({
        classifications_to_include    = optional(list(string))
        package_names_mask_to_exclude = optional(list(string))
        package_names_mask_to_include = optional(list(string))
      })))
      reboot = optional(string)
      windows = optional(list(object({
        classifications_to_include = optional(list(string))
        kb_numbers_to_exclude      = optional(list(string))
        kb_numbers_to_include      = optional(list(string))
      })))
    }))
    window = optional(object({
      duration             = optional(string)
      expiration_date_time = optional(string)
      recur_every          = optional(string)
      start_date_time      = string
      time_zone            = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.window == null || (v.window.duration == null || (can(regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$", v.window.duration))))
      )
    ])
    error_message = "duration must match the format HH:mm"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.window == null || (v.window.recur_every == null || (length(v.window.recur_every) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.install_patches == null || (v.install_patches.linux == null || alltrue([for item in v.install_patches.linux : (item.classifications_to_include == null || (alltrue([for x in item.classifications_to_include : contains(["Critical", "Security", "Other"], x)])))]))
      )
    ])
    error_message = "must be one of: Critical, Security, Other"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.install_patches == null || (v.install_patches.windows == null || alltrue([for item in v.install_patches.windows : (item.classifications_to_include == null || (alltrue([for x in item.classifications_to_include : contains(["Critical", "Security", "UpdateRollup", "FeaturePack", "ServicePack", "Definition", "Tools", "Updates"], x)])))]))
      )
    ])
    error_message = "must be one of: Critical, Security, UpdateRollup, FeaturePack, ServicePack, Definition, Tools, Updates"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.in_guest_user_patch_mode == null || (contains(["Platform", "User"], v.in_guest_user_patch_mode))
      )
    ])
    error_message = "must be one of: Platform, User"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.properties == null || (alltrue([for x in v.properties : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.maintenance_configurations : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

