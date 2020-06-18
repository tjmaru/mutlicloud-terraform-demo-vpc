locals {
  cloud = lower(var.cloud)
  azure = local.cloud == "azure"
  aws   = local.cloud == "aws"
  gcp   = local.cloud == "gcp"
}
