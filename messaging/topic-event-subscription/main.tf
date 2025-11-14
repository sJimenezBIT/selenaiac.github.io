resource "azurerm_eventgrid_system_topic_event_subscription" "sus_" {
  name                = var.topic_event_subscription_name
  resource_group_name = var.resource_group.name
  system_topic        = var.egst_name

  # azure_function_endpoint {
  #   function_id = var.function_app_id
  # }

  included_event_types = var.topic_event_subscription.included_event_types

  # El subject para Storage luce así:
  # /blobServices/default/containers/<container>/blobs/<path/archivo>
  # subject_filter {
  #   subject_begins_with = "/blobServices/default/containers/${azurerm_storage_container.a.name}/"
  # }
}
