# If using enviornment variables to set the service account key ID and private key, use an empty provider block:
# export DEFAKTO_SA_KEY_ID="sak-abcd1234"
# export DEFAKTO_SA_PRIVATE_KEY=$(cat path/to/private-key.pem)
# Or use SPIRL_SA_KEY_ID and SPIRL_SA_PRIVATE_KEY instead.
provider "spirl" {}
