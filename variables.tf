#######################
# Multi-Cloud Variables
#######################
variable "cloud" {
  description = "Multi-Cloud: Cloud to deploy in (Azure, AWS or GCP)"
  type        = string
  validation {
    condition     = contains(["azure", "aws", "gcp"], lower(var.cloud))
    error_message = "MultiCloud: Cloud should be on of: AWS, Azure or GCP."
  }
}

variable "cloud_location" {
  description = "Multi-Cloud: Mapping of cloud regions for multi-cloud."
  type        = map
}

variable "location" {
  description = "Multi-Cloud: Abstract location name"
  type        = string
}
##################
# Common variables
##################
variable "name" {
  description = "Common: Resources name"
  type        = string
}

variable "environment" {
  description = "Common: Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "Common: VPC CIDR"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 1))
    error_message = "CIDR should be valid."
  }
}

variable "subnet_cidr" {
  description = "Common: Subnet CIDR"
  type        = string
  validation {
    condition     = can(cidrhost(var.subnet_cidr, 1))
    error_message = "CIDR should be valid."
  }
}

variable "tags" {
  description = "Common: Mapping of tags being associated with the resources"
  type        = map(string)
}

###############
# GCP variables
###############
variable "gcp_project" {
  description = "GCP: Google Cloud Platform project name"
  type        = string
}
