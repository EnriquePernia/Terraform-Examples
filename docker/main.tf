# Pulls the image
module "image" {
  source   = "../modules/image"
  for_each = local.deployment
  # image_name references to var.image_name in module
  image_name = each.value.image
}

# Create a container
module "container" {
  source = "../modules/container"
  # Same number of containers as random names for them
  # Mantained out of the module
  # Can also be count = var.containers_amount (But i prefeer it to depend on resources created)
  for_each = local.deployment
  # count = length(random_id.rnd_container_name)
  # Reference to the module output
  count_in       = each.value.container_count
  id_length_in   = var.random_id_length
  name_in        = each.key
  image_in       = module.image[each.key].image_name
  name_prefix_in = var.container_name_prefix
  # Assign a random name for each container]
  int_port_in = each.value.int
  ext_port_in = each.value.ext
  volumes_in  = each.value.volumes
}