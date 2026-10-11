output "data_loss_prevention_inspect_templates_id" {
  description = "Map of id values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no id are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_loss_prevention_inspect_templates_allow_limited_availability_info_types" {
  description = "Map of allow_limited_availability_info_types values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no allow_limited_availability_info_types are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.allow_limited_availability_info_types if v.allow_limited_availability_info_types != null }
}
output "data_loss_prevention_inspect_templates_deletion_policy" {
  description = "Map of deletion_policy values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no deletion_policy are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "data_loss_prevention_inspect_templates_description" {
  description = "Map of description values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no description are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.description if v.description != null && length(v.description) > 0 }
}
output "data_loss_prevention_inspect_templates_display_name" {
  description = "Map of display_name values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no display_name are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "data_loss_prevention_inspect_templates_inspect_config" {
  description = "Map of inspect_config values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no inspect_config are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => one(v.inspect_config) if v.inspect_config != null && length(v.inspect_config) > 0 }
}
output "data_loss_prevention_inspect_templates_name" {
  description = "Map of name values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no name are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_loss_prevention_inspect_templates_parent" {
  description = "Map of parent values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no parent are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "data_loss_prevention_inspect_templates_template_id" {
  description = "Map of template_id values across all data_loss_prevention_inspect_templates, keyed the same as var.data_loss_prevention_inspect_templates except keys with no template_id are omitted"
  value       = { for k, v in google_data_loss_prevention_inspect_template.data_loss_prevention_inspect_templates : k => v.template_id if v.template_id != null && length(v.template_id) > 0 }
}

