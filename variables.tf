variable "region" {
  type    = string
  default = "us-east-2"
}

variable "name" {
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "ami" {
  type = string
}

variable "keypair" {
  type = string
}

variable "account_no" {
  type = number
}

variable "user" {
  type = string
}

variable "preferred_number_of_public_subnets" {
  default     = null
  type        = number
  description = "number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  default     = null
  type        = number
  description = "number of private subnets"
}

variable "environment" {
  type = string
}

variable "master-username" {
  type = string
}

variable "master-password" {
  type = string
}

variable "db_name" {
  type = string
}

variable "multi_az" {
  type = bool
}

variable "identifier" {
  type = string
}