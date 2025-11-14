resource "azurerm_eventgrid_system_topic" "egst" {
  name                = var.eventgrid_system_topic.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  # Tipo y origen del evento (obligatorios)
  topic_type             = var.eventgrid_system_topic.topic_type
  source_arm_resource_id = var.sa_id

  tags = merge(var.tags, {
    service = "Event Grid System Topic"
  })
}
