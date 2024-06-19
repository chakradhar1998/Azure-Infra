variable "resource_group_name" {
  description = "Resource group name"
  default = "app-grp"
  
}

variable "location" {
  description = "Resource group location"
  default = "westus2"
}


# variable "number_of_subnets" {
#   type        = number
#   description = "This defines the number of subnets i want"
#   default     = 0
#   validation {
#     condition     = var.number_of_subnets < 5
#     error_message = "The nmber of subnet must be less than 5."
#   }

# }

# variable "number_of_machines" {
#   type        = number
#   description = "This defines number of VM"
#   default     = 0
# }

variable "subscription_id" {
  type        = string
  description = "subscription id"

}

# variable "create-vnet" {
#   type        = bool
#   description = "Will be used to deploy vnet on the required subscription"
#   default     = false

# }

# variable "create-nsg" {
#   type        = bool
#   description = "Will be used to deploy nsg to the subscriptions"
#   default     = false

# }