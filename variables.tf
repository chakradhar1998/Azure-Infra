variable "number_of_subnets" {
  type        = number
  description = "This defines the number of subnets i want"
  default     = 2
  validation {
    condition = var.number_of_subnets < 5
    error_message = "The nmber of subnet must be less than 5."
  }

}