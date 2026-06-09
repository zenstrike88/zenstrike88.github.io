provider "dynatrace" {
  dt_env_url   = var.dynatrace_env_url
  dt_api_token = var.dynatrace_api_token
}

variable "dynatrace_env_url" {
  type        = string
  description = "URL du tenant Dynatrace"
}

variable "dynatrace_api_token" {
  type        = string
  sensitive   = true
  description = "Token API Dynatrace"
}
