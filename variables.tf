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
  # --- Unconfirmed validation candidates, derived from azurerm_maintenance_configuration's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: scope
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: visibility
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: window.duration
  #   condition: can(regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$", value))
  #   message:   duration must match the format HH:mm
  # path: window.time_zone
  #   source:    validate.MaintenanceTimeZone: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: window.recur_every
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: install_patches.linux.classifications_to_include[*]
  #   condition: contains(["Critical", "Security", "Other"], value)
  #   message:   must be one of: Critical, Security, Other
  # path: install_patches.windows.classifications_to_include[*]
  #   condition: contains(["Critical", "Security", "UpdateRollup", "FeaturePack", "ServicePack", "Definition", "Tools", "Updates"], value)
  #   message:   must be one of: Critical, Security, UpdateRollup, FeaturePack, ServicePack, Definition, Tools, Updates
  # path: install_patches.reboot
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: in_guest_user_patch_mode
  #   condition: contains(["Platform", "User"], value)
  #   message:   must be one of: Platform, User
  # path: properties[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

