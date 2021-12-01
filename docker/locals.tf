locals {
  deployment = {
    nginx = {
      image           = var.docker_image_name["nginx"][terraform.workspace]
      int             = 80
      ext             = var.container_external_port["nginx"][terraform.workspace]
      volumes = [
          { container_path  = "/data" }
        ]
      container_count = length(var.container_external_port["nginx"][terraform.workspace])
    }
    influxdb = {
      image           = var.docker_image_name["influx"][terraform.workspace]
      int             = 80
      ext             = var.container_external_port["influx"][terraform.workspace]
      volumes = [
          { container_path  = "/data" }
        ]
      container_count = length(var.container_external_port["influx"][terraform.workspace])
    }
    grafana = {
      image           = var.docker_image_name["grafana"][terraform.workspace]
      int             = 3000
      ext             = var.container_external_port["grafana"][terraform.workspace]
      volumes = [
        { container_path  = "/var/lib/grafana" },
        { container_path  = "/etc/grafana" }
      ]
      container_count = length(var.container_external_port["grafana"][terraform.workspace])
    }
  }
}
