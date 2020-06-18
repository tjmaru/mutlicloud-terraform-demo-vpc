output "subnet_id" {
  description = "Subnet ID"
  value = coalesce(
    join("", azurerm_subnet.subnet.*.id),
    join("", module.aws_vpc.public_subnets),
    join("", google_compute_subnetwork.subnet.*.id),
    "dummy"
  )
}

output "vpc_id" {
  description = "VPC ID"
  value = coalesce(
    join("", azurerm_virtual_network.vnet.*.name),
    module.aws_vpc.vpc_id,
    join("", google_compute_network.network.*.self_link),
    "dummy"
  )
}
