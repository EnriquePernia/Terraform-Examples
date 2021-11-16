variable "containers_amount" {
  type        = number
  default     = 1
  description = "Number of containers deployed"
  validation {
    condition     = var.containers_amount >= 1 && var.containers_amount < 10
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
  type        = number
  description = "External port exposed on docker containers"
  sensitive   = true
}

variable "docker_host" {
  type        = string
  description = "Value of the docker host"
}

variable "docker_image_name" {
  type        = string
  description = "Docker image used on containers"
}

variable "random_id_length" {
  type        = number
  description = "Lenth of unique id string for each container"
  validation {
    condition     = var.random_id_length > 4 && var.random_id_length < 10
    error_message = "Invalid random_id lenght."
  }
}
