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
    visibility               = optional(string, "Custom")
    install_patches = optional(object({
      linux = optional(object({
        classifications_to_include    = optional(list(string))
        package_names_mask_to_exclude = optional(list(string))
        package_names_mask_to_include = optional(list(string))
      }))
      reboot = optional(string)
      windows = optional(object({
        classifications_to_include = optional(list(string))
        kb_numbers_to_exclude      = optional(list(string))
        kb_numbers_to_include      = optional(list(string))
      }))
    }))
    window = optional(object({
      duration             = optional(string)
      expiration_date_time = optional(string)
      recur_every          = optional(string)
      start_date_time      = string
      time_zone            = string
    }))
  }))
}

