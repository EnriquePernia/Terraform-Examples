variable "container_name_prefix" {
  type        = string
  description = "Prefix added to container names"
}

variable "container_internal_port" {
  type        = number
  description = "Internal port exposed on docker containers"
}

variable "container_external_port" {
  type        = map(map(list(number)))
  description = "External port exposed on docker containers"
  sensitive   = false
  # validation {
  #   condition     = max(var.container_external_port["nginx"]["dev"]...) < 9000 && min(var.container_external_port["nginx"]["dev"]...) > 8000
  #   error_message = "External port range out of bounds on dev env."
  # }
  # validation {
  #   condition     = max(var.container_external_port["nginx"]["prod"]...) < 2000 && min(var.container_external_port["nginx"]["prod"]...) > 1000
  #   error_message = "External port range out of bounds on prod env."
  # }
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