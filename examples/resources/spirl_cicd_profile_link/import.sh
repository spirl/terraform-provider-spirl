#!/bin/bash

# CI/CD profile link can be imported using a combination of the
# CI/CD profile ID and the cluster ID separated by a colon
# CI/CD profile ID: cicdp-1234567890
# Cluster ID: c-121212121212
terraform import spirl_cicd_profile_link.example "cicdp-1234567890:c-121212121212"
