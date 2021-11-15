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
  prefix = "container-"
  byte_length = 8
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = random_id.rnd_container_name.hex

  # Expose 80 internal port on 8080 external
  ports {
    internal = 80
    external = 8080
  }
}