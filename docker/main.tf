locals {
  deployment = {
    nginx = {
      image           = var.docker_image_name["nginx"][terraform.workspace]
      int             = 80
      ext             = var.container_external_port["nginx"][terraform.workspace]
      container_path  = "/data"
      container_count = length(var.container_external_port["nginx"][terraform.workspace])
    }
    influxdb = {
      image           = var.docker_image_name["influx"][terraform.workspace]
      int             = 80
      ext             = var.container_external_port["influx"][terraform.workspace]
      container_path  = "/data"
      container_count = length(var.container_external_port["influx"][terraform.workspace])
    }
    grafana = {
      image           = var.docker_image_name["grafana"][terraform.workspace]
      int             = 3000
      ext             = var.container_external_port["grafana"][terraform.workspace]
      container_path  = "/var/lib/grafana"
      container_count = length(var.container_external_port["grafana"][terraform.workspace])
    }
  }
}

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
  image_in       = module.image[each.key].image_name
  name_prefix_in = var.container_name_prefix
  # Assign a random name for each container]
  int_port_in       = each.value.int
  ext_port_in       = each.value.ext
  container_path_in = each.value.container_path
  # Path.cwd refers to ./
  host_path_in = join("/", [path.cwd], [each.value.container_path])
} 