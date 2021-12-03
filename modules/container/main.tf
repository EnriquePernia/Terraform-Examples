# Provides a random name for resources
resource "random_id" "rnd_container_name" {
  count       = var.count_in
  prefix      = var.name_prefix_in
  byte_length = var.id_length_in
}



# Create a container
resource "docker_container" "container" {
  count = var.count_in
  image = var.image_in
  name  = "${var.name_in}-${random_id.rnd_container_name[count.index].hex}"
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }
  # Dynamic blocks
  dynamic "volumes" {
    for_each = var.volumes_in
    content {
      container_path = volumes.value.container_path
      volume_name    = module.volume[count.index].volume_output[volumes.key]
    }
  }
}

module "volume" {
  source        = "./volume"
  count         = var.count_in
  volumes_count = length(var.volumes_in)
  volume_name   = "${var.name_in}-${count.index}-volume"
}