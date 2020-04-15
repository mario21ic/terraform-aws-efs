variable "region" {
  description = "aws region"
  #default     = "eu-west-1"
}

variable "name" {
  description = "efs name"
}

variable "env" {
  description = "environment name"
}

# vpc variables
variable "vpc_id" {
  description = "vpc id"
}

variable "subnet_ids" {
  type = "list"
  description = "Subnet ids"
}

variable "security_group_ids" {
  type = "list"
  description = "Security group ids to allow access"
}

