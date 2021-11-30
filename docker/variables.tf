locals {
  containers_max_amount = length(var.container_external_port[terraform.workspace])
}

# Not used since we use a number based on the amount of ports allowed
variable "containers_amount" {
  type        = number
  default     = 1
  description = "Number of containers deployed"
  validation {
    condition     = var.containers_amount >= 1 # && var.containers_amount < local.containers_max_amount
    error_message = "Trying to deploy an invalid number of containers."
  }
}

variable "container_name_prefix" {
  type        = string
  description = "Prefix added to container names"
}

variable "container_internal_port" {
  type        = number
  description = "Internal port exposed on docker containers"
}

variable "container_external_port" {
  type        = map(list(number))
  description = "External port exposed on docker containers"
  sensitive   = false
  validation {
    condition     = max(var.container_external_port["dev"]...) < 9000 && min(var.container_external_port["dev"]...) > 8000
    error_message = "External port range out of bounds on dev env."
  }
  validation {
    condition     = max(var.container_external_port["prod"]...) < 2000 && min(var.container_external_port["prod"]...) > 1000
    error_message = "External port range out of bounds on prod env."
  }
}

variable "container_path" {
  type        = string
  description = "Internal container path to attach the local volume"
}

variable "docker_host" {
  type        = string
  description = "Value of the docker host"
}

variable "docker_image_name" {
  type        = map(map(string))
  description = "Docker image used on containers"
}

variable "random_id_length" {
  type        = number
  description = "Lenth of unique id string for each container"
  validation {
    condition     = var.random_id_length >= 4 && var.random_id_length < 10
    error_message = "Invalid random_id lenght."
  }
}

# Not needed since we use terraform.workspace
# variable "env" {
#   type        = string
#   default     = "dev"
#   description = "Environment to deploy to"
# }