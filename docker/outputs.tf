output "Address" {
  # Runs a for loop to show multiple outputs. Join wont join a tuple (join(":", ["localhost", docker_container.nginx[*].ports[0].external]))
  # i.ports[*].external is outside the list because it is already a list with one element
  # Another way without splat operator [*]:
  # value = [for i in docker_container.nginx[*]: join(":", ["localhost", i.ports[0].external])]
  value = [for i in docker_container.nginx[*]: join(":", ["localhost"], i.ports[*].external)]
  description = "Local address of the Nginx docker container"
}

output "Container_name" {
  # Use splat operator to output multiple resources
  value = docker_container.nginx[*].name
  description = "Name of Nginx docker container"
}
