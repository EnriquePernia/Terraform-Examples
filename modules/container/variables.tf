variable "image_in" {
  type        = string
  description = "Image for the containers deployed"
}

variable "name_in" {
  type        = string
  description = "Name of the image for the containers deployed"
}

variable "int_port_in" {
  type        = number
  description = "Internal port for the containers deployed"
}

variable "ext_port_in" {
  type        = list(number)
  description = "External port for the containers deployed"
}

variable "volumes_in" {
  type        = list(map(string))
  description = "Volume path on the host for the containers deployed"
}

variable "count_in" {
  type        = number
  description = "Number of containers to deploy"
}

variable "id_length_in" {
  type        = number
  description = "Length of the container name id"
}

variable "name_prefix_in" {
  type        = string
  description = "Value of the name prefix for the containers"
}