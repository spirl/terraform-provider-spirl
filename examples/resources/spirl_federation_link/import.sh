# Clusters can be imported using a combination of the trust-domain id
# and the foreign trust domain name separated by a forward slash
# Trust Domain ID: td-123456
# Foreign Trust Domain Name: foreign-trust-domain-name.com
terraform import spirl_cluster.example td-123456/foreign-trust-domain-name.com
