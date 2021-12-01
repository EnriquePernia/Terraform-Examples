# output "address" {
#   # Runs a for loop to show multiple outputs. Join wont join a tuple (join(":", ["localhost", docker_container.nginx[*].ports[0].external]))
#   # i.ports[*].external is outside the list because it is already a list with one element
#   # Another way without splat operator [*]:
#   # value = [for i in docker_container.nginx[*]: join(":", ["localhost", i.ports[0].external])]
#   value       = join(" -> ", [docker_container.container.name], [join(":", ["localhost"], docker_container.container.ports[*].external)])
#   description = "Local address of the Nginx docker container"
#   sensitive   = false
# }

# output "container_internal_port" {
#   value       = join(" -> ", ["Internal port"], docker_container.container.ports[*].internal)
#   description = "Internal port of docker containers"
# }

# output "name" {
#   value       = docker_container.container.name
#   description = "Internal port of docker containers"
# }

output "container_info" {
  value = {for x in docker_container.container[*]: x.name => join(":", [x.ip_address], x.ports[*]["external"])}
  description = "Container name plus ip address and external port"
}