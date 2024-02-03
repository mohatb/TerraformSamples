resource "random_string" "name" {
  length  = 10
  special = false
  upper   = false
  numeric  = true
  lower   = true
}