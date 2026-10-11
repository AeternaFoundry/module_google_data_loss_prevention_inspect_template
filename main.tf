resource "google_data_loss_prevention_inspect_template" "data_loss_prevention_inspect_templates" {
  for_each = var.data_loss_prevention_inspect_templates

  parent                                = each.value.parent
  allow_limited_availability_info_types = each.value.allow_limited_availability_info_types
  deletion_policy                       = each.value.deletion_policy
  description                           = each.value.description
  display_name                          = each.value.display_name
  template_id                           = each.value.template_id

  dynamic "inspect_config" {
    for_each = each.value.inspect_config != null ? [each.value.inspect_config] : []
    content {
      content_options = inspect_config.value.content_options
      dynamic "custom_info_types" {
        for_each = inspect_config.value.custom_info_types != null ? inspect_config.value.custom_info_types : []
        content {
          dynamic "dictionary" {
            for_each = custom_info_types.value.dictionary != null ? [custom_info_types.value.dictionary] : []
            content {
              dynamic "cloud_storage_path" {
                for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                content {
                  path = cloud_storage_path.value.path
                }
              }
              dynamic "word_list" {
                for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                content {
                  words = word_list.value.words
                }
              }
            }
          }
          exclusion_type = custom_info_types.value.exclusion_type
          info_type {
            name = custom_info_types.value.info_type.name
            dynamic "sensitivity_score" {
              for_each = custom_info_types.value.info_type.sensitivity_score != null ? [custom_info_types.value.info_type.sensitivity_score] : []
              content {
                score = sensitivity_score.value.score
              }
            }
            version = custom_info_types.value.info_type.version
          }
          likelihood = custom_info_types.value.likelihood
          dynamic "regex" {
            for_each = custom_info_types.value.regex != null ? [custom_info_types.value.regex] : []
            content {
              group_indexes = regex.value.group_indexes
              pattern       = regex.value.pattern
            }
          }
          dynamic "sensitivity_score" {
            for_each = custom_info_types.value.sensitivity_score != null ? [custom_info_types.value.sensitivity_score] : []
            content {
              score = sensitivity_score.value.score
            }
          }
          dynamic "stored_type" {
            for_each = custom_info_types.value.stored_type != null ? [custom_info_types.value.stored_type] : []
            content {
              name = stored_type.value.name
            }
          }
          dynamic "surrogate_type" {
            for_each = custom_info_types.value.surrogate_type != null ? [custom_info_types.value.surrogate_type] : []
            content {
            }
          }
        }
      }
      exclude_info_types = inspect_config.value.exclude_info_types
      include_quote      = inspect_config.value.include_quote
      dynamic "info_types" {
        for_each = inspect_config.value.info_types != null ? inspect_config.value.info_types : []
        content {
          name = info_types.value.name
          dynamic "sensitivity_score" {
            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
            content {
              score = sensitivity_score.value.score
            }
          }
          version = info_types.value.version
        }
      }
      dynamic "limits" {
        for_each = inspect_config.value.limits != null ? [inspect_config.value.limits] : []
        content {
          dynamic "max_findings_per_info_type" {
            for_each = limits.value.max_findings_per_info_type != null ? limits.value.max_findings_per_info_type : []
            content {
              dynamic "info_type" {
                for_each = max_findings_per_info_type.value.info_type != null ? [max_findings_per_info_type.value.info_type] : []
                content {
                  name = info_type.value.name
                  dynamic "sensitivity_score" {
                    for_each = info_type.value.sensitivity_score != null ? [info_type.value.sensitivity_score] : []
                    content {
                      score = sensitivity_score.value.score
                    }
                  }
                  version = info_type.value.version
                }
              }
              max_findings = max_findings_per_info_type.value.max_findings
            }
          }
          max_findings_per_item    = limits.value.max_findings_per_item
          max_findings_per_request = limits.value.max_findings_per_request
        }
      }
      min_likelihood = inspect_config.value.min_likelihood
      dynamic "min_likelihood_per_info_type" {
        for_each = inspect_config.value.min_likelihood_per_info_type != null ? inspect_config.value.min_likelihood_per_info_type : []
        content {
          dynamic "info_type" {
            for_each = min_likelihood_per_info_type.value.info_type != null ? [min_likelihood_per_info_type.value.info_type] : []
            content {
              name    = info_type.value.name
              version = info_type.value.version
            }
          }
          min_likelihood = min_likelihood_per_info_type.value.min_likelihood
        }
      }
      dynamic "rule_set" {
        for_each = inspect_config.value.rule_set != null ? inspect_config.value.rule_set : []
        content {
          dynamic "info_types" {
            for_each = rule_set.value.info_types
            content {
              name = info_types.value.name
              dynamic "sensitivity_score" {
                for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              version = info_types.value.version
            }
          }
          dynamic "rules" {
            for_each = rule_set.value.rules
            content {
              dynamic "exclusion_rule" {
                for_each = rules.value.exclusion_rule != null ? [rules.value.exclusion_rule] : []
                content {
                  dynamic "dictionary" {
                    for_each = exclusion_rule.value.dictionary != null ? [exclusion_rule.value.dictionary] : []
                    content {
                      dynamic "cloud_storage_path" {
                        for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                        content {
                          path = cloud_storage_path.value.path
                        }
                      }
                      dynamic "word_list" {
                        for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                        content {
                          words = word_list.value.words
                        }
                      }
                    }
                  }
                  dynamic "exclude_by_hotword" {
                    for_each = exclusion_rule.value.exclude_by_hotword != null ? [exclusion_rule.value.exclude_by_hotword] : []
                    content {
                      hotword_regex {
                        group_indexes = exclude_by_hotword.value.hotword_regex.group_indexes
                        pattern       = exclude_by_hotword.value.hotword_regex.pattern
                      }
                      proximity {
                        window_after  = exclude_by_hotword.value.proximity.window_after
                        window_before = exclude_by_hotword.value.proximity.window_before
                      }
                    }
                  }
                  dynamic "exclude_info_types" {
                    for_each = exclusion_rule.value.exclude_info_types != null ? [exclusion_rule.value.exclude_info_types] : []
                    content {
                      dynamic "info_types" {
                        for_each = exclude_info_types.value.info_types
                        content {
                          name = info_types.value.name
                          dynamic "sensitivity_score" {
                            for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                            content {
                              score = sensitivity_score.value.score
                            }
                          }
                          version = info_types.value.version
                        }
                      }
                    }
                  }
                  matching_type = exclusion_rule.value.matching_type
                  dynamic "regex" {
                    for_each = exclusion_rule.value.regex != null ? [exclusion_rule.value.regex] : []
                    content {
                      group_indexes = regex.value.group_indexes
                      pattern       = regex.value.pattern
                    }
                  }
                }
              }
              dynamic "hotword_rule" {
                for_each = rules.value.hotword_rule != null ? [rules.value.hotword_rule] : []
                content {
                  hotword_regex {
                    group_indexes = hotword_rule.value.hotword_regex.group_indexes
                    pattern       = hotword_rule.value.hotword_regex.pattern
                  }
                  likelihood_adjustment {
                    fixed_likelihood    = hotword_rule.value.likelihood_adjustment.fixed_likelihood
                    relative_likelihood = hotword_rule.value.likelihood_adjustment.relative_likelihood
                  }
                  proximity {
                    window_after  = hotword_rule.value.proximity.window_after
                    window_before = hotword_rule.value.proximity.window_before
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

