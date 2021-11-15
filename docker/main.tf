terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Provides a random name for resources
resource "random_id" "rnd_container_name" {
  count = 2
  prefix = "container-"
  byte_length = 8
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a nginx container
resource "docker_container" "nginx" {
  # Same number of containers as random names for them
  count = length(random_id.rnd_container_name)
  image = docker_image.nginx.latest
  # Assign a random name for each container
  name  = random_id.rnd_container_name[count.index].hex

  # Expose 80 internal port on 8080 external
  ports {
    internal = 80
    # Auto allocate, if we have multiple resources its better to output its value and let tf handle it
    # external = 8080
  }
}