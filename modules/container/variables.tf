variable "name_in" {
  type        = string
  description = "Name for the containers deployed"
}

variable "image_in" {
  type        = string
  description = "Image for the containers deployed"
}

variable "int_port_in" {
  type        = number
  description = "Internal port for the containers deployed"
}

variable "ext_port_in" {
  type        = number
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