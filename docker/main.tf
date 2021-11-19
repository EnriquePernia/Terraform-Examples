# Provides a random name for resources
resource "random_id" "rnd_container_name" {
  count       = local.containers_max_amount
  prefix      = var.container_name_prefix
  byte_length = var.random_id_length
}

# Pulls the image
module "image" {
  source = "../modules/image"
  # image_name references to var.image_name in module
  image_name = var.docker_image_name[terraform.workspace]
}

# Create a container
module "container" {
  source = "../modules/container"
  # Same number of containers as random names for them
  # Mantained out of the module
  # Can also be count = var.containers_amount (But i prefeer it to depend on resources created)
  count = length(random_id.rnd_container_name)
  # Reference to the module output
  image_in = module.image.image_name
  # Assign a random name for each container
  name_in = random_id.rnd_container_name[count.index].hex
  # Expose 80 internal port on 8080 external
  int_port_in = var.container_internal_port
  # Auto allocate, if we have multiple resources we can output its value and let tf handle it
  ext_port_in       = var.container_external_port[terraform.workspace][count.index]
  container_path_in = var.container_path
  # Path.cwd refers to ./
  host_path_in = "${path.cwd}/data"
}