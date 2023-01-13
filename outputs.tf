output "subnet_id" {
  description = "Subnet ID"
  value = coalesce(
    join("", google_compute_subnetwork.subnet.*.id),
    "dummy"
  )
}

output "vpc_id" {
  description = "VPC ID"
  value = coalesce(
    join("", google_compute_network.network.*.self_link),
    "dummy"
  )
}
