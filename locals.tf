locals {
  cloud = lower(var.cloud)
  gcp   = local.cloud == "gcp"
}
