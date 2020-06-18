resource "google_compute_network" "network" {
  count                   = local.gcp ? 1 : 0
  name                    = format("%s-%s", var.name, var.environment)
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  project                 = var.gcp_project
  description             = format("%s-%s", var.name, var.environment)
}

resource "google_compute_subnetwork" "subnet" {
  count         = local.gcp ? 1 : 0
  name          = var.name
  ip_cidr_range = var.subnet_cidr
  region        = var.cloud_location[var.location][var.cloud]
  network       = join("", google_compute_network.network.*.self_link)
}
