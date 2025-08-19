# A CI/CD Profile Link can be created to link a CI/CD Profile to a Cluster
# both created by Terraform.
resource "spirl_cicd_profile_link" "test" {
  cicd_profile_id = "spirl_cicd_profile.my_profile.id"
  cluster_id      = "spirl_cluster.my_cluster.id"
}
