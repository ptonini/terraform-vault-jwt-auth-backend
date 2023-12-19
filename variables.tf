variable "path" {}

variable "type" {
  default = "jwt"
  nullable = false
}

variable "oidc_discovery_url" {}

variable "bound_issuer" {
  default = null
}

variable "roles" {
  type = map(object({
    policies           = optional(list(string))
    policy_definitions = optional(list(string))
    user_claim         = optional(string)
    bound_claims       = map(string)
    token_ttl          = optional(number)
  }))
  default = null
}
