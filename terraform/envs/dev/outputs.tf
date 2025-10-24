output "n8n_access_key" {
  value     = module.iam.n8n_access_key

}

output "n8n_secret_key" {
  value     = module.iam.n8n_secret_key
  sensitive = true
}
