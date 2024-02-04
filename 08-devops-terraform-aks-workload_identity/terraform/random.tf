/*
  This resource block creates a random string using the "random_string" resource type.
  The generated string will have a length of 10 characters and will consist of lowercase alphabets and numeric digits.
*/

resource "random_string" "name" {
  length  = 10
  special = false
  upper   = false
  numeric = true
  lower   = true
}