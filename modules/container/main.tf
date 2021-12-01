# Provides a random name for resources
resource "random_id" "rnd_container_name" {
  count = var.count_in
  prefix      = var.name_prefix_in
  byte_length = var.id_length_in
}



# Create a container
resource "docker_container" "container" {
  count = length(random_id.rnd_container_name)
  image = var.image_in
  name = random_id.rnd_container_name[count.index].hex
  ports {
    internal = var.int_port_in
    # Auto allocate, if we have multiple resources we can output its value and let tf handle it
    external = var.ext_port_in[count.index]
  }
  volumes {
    container_path = var.container_path_in
    host_path = var.host_path_in
  }
}