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
  # Same number of containers as external ports for them
  # Mantained out of the module
  for_each       = local.deployment
  count_in       = each.value.container_count
  id_length_in   = var.random_id_length
  name_in        = each.key
  image_in       = module.image[each.key].image_name
  name_prefix_in = var.container_name_prefix
  int_port_in    = each.value.int
  ext_port_in    = each.value.ext
  volumes_in     = each.value.volumes
}