# module "eventgrid_system_topic" {
#   source                 = "./eventgrid-system-topic"
#   resource_group         = var.resource_group
#   eventgrid_system_topic = var.eventgrid_system_topic
#   sa_id                  = var.sa_id
#   tags                   = var.tags  
  
# }

# module "system_topic_subscription" {
#   source         = "./topic-event-subscription"
#   for_each       = var.eventgrid_system_topic_subscription
#   resource_group = var.resource_group

#   egst_name                     = module.eventgrid_system_topic.name    
#   function_app_id               = var.function_app_id
#   topic_event_subscription      = each.value
#   topic_event_subscription_name = each.key
  
# }
