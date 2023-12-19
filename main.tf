resource "vault_jwt_auth_backend" "this" {
  path               = var.path
  type               = var.type
  oidc_discovery_url = var.oidc_discovery_url
  bound_issuer       = coalesce(var.bound_issuer, var.oidc_discovery_url)
}

module "roles" {
  source             = "ptonini/jwt-auth-role/vault"
  version            = "~> 1.1.1"
  backend            = vault_jwt_auth_backend.this.path
  for_each           = var.roles
  role_type          = var.type
  name               = each.key
  bound_claims       = each.value.bound_claims
  user_claim         = each.value.user_claim
  policies           = each.value.policies
  policy_definitions = each.value.policy_definitions
  token_ttl          = each.value.token_ttl
}