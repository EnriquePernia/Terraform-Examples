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

# Create a nginx container
resource "docker_container" "nginx" {
  # Same number of containers as random names for them
  # Can also be count = var.containers_amount (But i prefeer it to depend on resources created)
  count = length(random_id.rnd_container_name)
  # Reference to the module output
  image = module.image.image_name
  # Assign a random name for each container
  name = random_id.rnd_container_name[count.index].hex
  # Expose 80 internal port on 8080 external
  ports {
    internal = var.container_internal_port
    # Auto allocate, if we have multiple resources we can output its value and let tf handle it
    external = var.container_external_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = var.container_path
    # Path.cwd refers to ./
    host_path = "${path.cwd}/data"
  }
}