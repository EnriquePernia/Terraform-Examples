variable "image_in" {
  type        = string
  description = "Image for the containers deployed"
}

variable "int_port_in" {
  type        = number
  description = "Internal port for the containers deployed"
}

variable "ext_port_in" {
  type        = list(number)
  description = "External port for the containers deployed"
}

variable "container_path_in" {
  type        = string
  description = "Volume path on the container for the containers deployed"
}

variable "host_path_in" {
  type        = string
  description = "Volume path on the host for the containers deployed"
}

variable "count_in" {
  type = number
  description = "Number of containers to deploy"
}

variable "id_length_in" {
  type = number
  description = "Length of the container name id"
}

variable "name_prefix_in" {
  type = string
  description = "Value of the name prefix for the containers"
}