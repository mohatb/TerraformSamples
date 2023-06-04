data "azuread_client_config" "primary" {}

resource "azuread_group" "primary" {
  display_name     = "${var.cluster_name}-aad-group"
  owners           = ["9def9aa7-4e39-462d-9887-75676f676bef"]
  security_enabled = true

  members = [
    "9def9aa7-4e39-462d-9887-75676f676bef",
    /* more users */
  ]
}