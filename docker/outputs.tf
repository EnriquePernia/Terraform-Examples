output "Address" {
  value = join(":", ["localhost", docker_container.nginx.ports[0].external])
  description = "Local address of the Nginx docker container"
}

output "Container_name" {
  value = docker_container.nginx.name
  description = "Name of Nginx docker container"
}