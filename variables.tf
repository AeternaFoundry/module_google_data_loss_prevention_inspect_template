variable "data_loss_prevention_inspect_templates" {
  description = <<EOT
Map of data_loss_prevention_inspect_templates, attributes below
Required:
    - parent
Optional:
    - allow_limited_availability_info_types
    - deletion_policy
    - description
    - display_name
    - template_id
    - inspect_config (block):
        - content_options (optional)
        - custom_info_types (optional, block):
            - dictionary (optional, block):
                - cloud_storage_path (optional, block):
                    - path (required)
                - word_list (optional, block):
                    - words (required)
            - exclusion_type (optional)
            - info_type (required, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - likelihood (optional)
            - regex (optional, block):
                - group_indexes (optional)
                - pattern (required)
            - sensitivity_score (optional, block):
                - score (required)
            - stored_type (optional, block):
                - name (required)
            - surrogate_type (optional, block):
        - exclude_info_types (optional)
        - include_quote (optional)
        - info_types (optional, block):
            - name (required)
            - sensitivity_score (optional, block):
                - score (required)
            - version (optional)
        - limits (optional, block):
            - max_findings_per_info_type (optional, block):
                - info_type (optional, block):
                    - name (required)
                    - sensitivity_score (optional, block):
                        - score (required)
                    - version (optional)
                - max_findings (required)
            - max_findings_per_item (required)
            - max_findings_per_request (required)
        - min_likelihood (optional)
        - min_likelihood_per_info_type (optional, block):
            - info_type (optional, block):
                - name (required)
                - version (optional)
            - min_likelihood (required)
        - rule_set (optional, block):
            - info_types (required, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - rules (required, block):
                - exclusion_rule (optional, block):
                    - dictionary (optional, block):
                        - cloud_storage_path (optional, block):
                            - path (required)
                        - word_list (optional, block):
                            - words (required)
                    - exclude_by_hotword (optional, block):
                        - hotword_regex (required, block):
                            - group_indexes (optional)
                            - pattern (required)
                        - proximity (required, block):
                            - window_after (optional)
                            - window_before (optional)
                    - exclude_info_types (optional, block):
                        - info_types (required, block):
                            - name (required)
                            - sensitivity_score (optional, block):
                                - score (required)
                            - version (optional)
                    - matching_type (required)
                    - regex (optional, block):
                        - group_indexes (optional)
                        - pattern (required)
                - hotword_rule (optional, block):
                    - hotword_regex (required, block):
                        - group_indexes (optional)
                        - pattern (required)
                    - likelihood_adjustment (required, block):
                        - fixed_likelihood (optional)
                        - relative_likelihood (optional)
                    - proximity (required, block):
                        - window_after (optional)
                        - window_before (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    parent                                = string
    allow_limited_availability_info_types = optional(bool)
    deletion_policy                       = optional(string)
    description                           = optional(string)
    display_name                          = optional(string)
    template_id                           = optional(string)
    inspect_config = optional(object({
      content_options = optional(list(string))
      custom_info_types = optional(list(object({
        dictionary = optional(object({
          cloud_storage_path = optional(object({
            path = string
          }))
          word_list = optional(object({
            words = list(string)
          }))
        }))
        exclusion_type = optional(string)
        info_type = object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        })
        likelihood = optional(string)
        regex = optional(object({
          group_indexes = optional(list(number))
          pattern       = string
        }))
        sensitivity_score = optional(object({
          score = string
        }))
        stored_type = optional(object({
          name = string
        }))
        surrogate_type = optional(object({
        }))
      })))
      exclude_info_types = optional(bool)
      include_quote      = optional(bool)
      info_types = optional(list(object({
        name = string
        sensitivity_score = optional(object({
          score = string
        }))
        version = optional(string)
      })))
      limits = optional(object({
        max_findings_per_info_type = optional(list(object({
          info_type = optional(object({
            name = string
            sensitivity_score = optional(object({
              score = string
            }))
            version = optional(string)
          }))
          max_findings = number
        })))
        max_findings_per_item    = number
        max_findings_per_request = number
      }))
      min_likelihood = optional(string)
      min_likelihood_per_info_type = optional(list(object({
        info_type = optional(object({
          name    = string
          version = optional(string)
        }))
        min_likelihood = string
      })))
      rule_set = optional(list(object({
        info_types = list(object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        }))
        rules = list(object({
          exclusion_rule = optional(object({
            dictionary = optional(object({
              cloud_storage_path = optional(object({
                path = string
              }))
              word_list = optional(object({
                words = list(string)
              }))
            }))
            exclude_by_hotword = optional(object({
              hotword_regex = object({
                group_indexes = optional(list(number))
                pattern       = string
              })
              proximity = object({
                window_after  = optional(number)
                window_before = optional(number)
              })
            }))
            exclude_info_types = optional(object({
              info_types = list(object({
                name = string
                sensitivity_score = optional(object({
                  score = string
                }))
                version = optional(string)
              }))
            }))
            matching_type = string
            regex = optional(object({
              group_indexes = optional(list(number))
              pattern       = string
            }))
          }))
          hotword_rule = optional(object({
            hotword_regex = object({
              group_indexes = optional(list(number))
              pattern       = string
            })
            likelihood_adjustment = object({
              fixed_likelihood    = optional(string)
              relative_likelihood = optional(number)
            })
            proximity = object({
              window_after  = optional(number)
              window_before = optional(number)
            })
          }))
        }))
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_inspect_templates : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (length(item.info_types) >= 1)]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_inspect_templates : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (length(item.rules) >= 1)]))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_inspect_templates : (
        v.inspect_config == null || (v.inspect_config.rule_set == null || alltrue([for item in v.inspect_config.rule_set : (alltrue([for item in item.rules : (item.exclusion_rule == null || (item.exclusion_rule.exclude_info_types == null || (length(item.exclusion_rule.exclude_info_types.info_types) >= 1)))]))]))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

