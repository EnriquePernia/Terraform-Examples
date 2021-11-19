# Create a container
resource "docker_container" "container" {
  # Reference to the module output
  image = var.image_in
  # Assign a random name for each container
  name = var.name_in
  # Expose 80 internal port on 8080 external
  ports {
    internal = var.int_port_in
    # Auto allocate, if we have multiple resources we can output its value and let tf handle it
    external = var.ext_port_in
  }
  volumes {
    container_path = var.container_path_in
    # Path.cwd refers to ./
    host_path = var.host_path_in
  }
}