terraform {
  required_version = "~> 0.12.6"
  experiments      = [variable_validation]
  required_providers {
    google  = ">= 3.21"
  }
}
