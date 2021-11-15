terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {
  host = var.docker_host
}

# Provides a random name for resources
resource "random_id" "rnd_container_name" {
  count       = var.containers_amount
  prefix      = var.container_name_prefix
  byte_length = var.random_id_length
}

# Pulls the image
resource "docker_image" "nginx" {
  name = var.docker_image_name
}

# Create a nginx container
resource "docker_container" "nginx" {
  # Same number of containers as random names for them
  # Can also be count = var.containers_amount (But i prefeer it to depend on resources created)
  count = length(random_id.rnd_container_name)
  image = docker_image.nginx.latest
  # Assign a random name for each container
  name = random_id.rnd_container_name[count.index].hex

  # Expose 80 internal port on 8080 external
  ports {
    internal = var.container_internal_port
    # Auto allocate, if we have multiple resources its better to output its value and let tf handle it
    # external = 8080
  }
}