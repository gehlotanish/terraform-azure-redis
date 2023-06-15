locals {
  default_tags = {
    "Environment" = var.environment
  }

  redis_family_map = {
    Basic    = "C",
    Standard = "C",
    Premium  = "P"
  }
}
