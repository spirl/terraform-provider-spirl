data "spirl_service_account" "deployer" {
  name = "my-deployer-sa"
}

output "deployer_id" {
  value = data.spirl_service_account.deployer.id
}
