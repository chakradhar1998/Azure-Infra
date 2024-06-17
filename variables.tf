variable "number_of_subnets" {
  type        = number
  description = "This defines the number of subnets i want"
  default     = 2
  validation {
    condition     = var.number_of_subnets < 5
    error_message = "The nmber of subnet must be less than 5."
  }

}

variable "number_of_machines" {
  type        = number
  description = "This defines number of VM"
  default     = 2
}

variable "storage_account_name" {
  type        = string
  description = "The tfvars storage account name"

}
