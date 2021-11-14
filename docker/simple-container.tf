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

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx"

  # Expose 80 internal port on 8080 external
  ports {
    internal = 80
    external = 8080
  }
}