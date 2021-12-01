# output "Address" {
#   value       = module.container[*].address
#   description = "Local address of the Nginx docker container"
#   sensitive   = false
# }

# output "Container_image" {
#   # Can also be done with join:
#   # [for i in module.container[*] : join(" - ", [i.name], [module.image.image_name], [terraform.workspace])]
#   value       = [for i in module.container[*] : "${i.name} - ${module.image["nginx"].image_name} - ${terraform.workspace}"]
#   description = "Name of Nginx docker container"
# }

# output "Container_internal_port" {
#   value       = module.container[*].container_internal_port
#   description = "Internal port of docker containers"
# }

output "Address" {
  value = module.container[*]
  description = "Address of the containers"  
}