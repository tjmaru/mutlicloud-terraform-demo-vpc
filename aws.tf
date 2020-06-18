data "aws_availability_zones" "available" {
  count = local.aws ? 1 : 0
  state = "available"
}

module "aws_vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  create_vpc     = local.aws
  name           = var.name
  cidr           = var.vpc_cidr
  public_subnets = [var.subnet_cidr]
  tags           = var.tags
  azs            = local.aws ? data.aws_availability_zones.available.0.names : []
}
