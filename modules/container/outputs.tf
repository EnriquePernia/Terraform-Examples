output "container_info" {
  value       = { for x in docker_container.container[*] : x.name => join(":", [x.ip_address], x.ports[*]["external"]) }
  description = "Container name plus ip address and external port"
}