# output "subnet0_id" {
#   value = azurerm_subnet.subnets[0].id
#   precondition {
#     condition = var.number_of_subnets > 0
#     error_message = "There is no subnet itself"
#   }
# }

# output "subnet1_id" {
#   value = azurerm_subnet.subnets[1].id
#   precondition {
#     condition = var.number_of_subnets > 0
#     error_message = "There is no subnet itself"
#   }
# }

# output "subnet2_id" {
#   value = azurerm_subnet.subnets[2].id
#   precondition {
#     condition = var.number_of_subnets > 0
#     error_message = "There is no subnet itself"
#   }
# }