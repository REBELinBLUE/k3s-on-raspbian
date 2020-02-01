#!/bin/bash

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)
source "$REPO_ROOT/setup/.env"

kubectl -n registry create secret generic docker-registry-auth --from-literal=htpasswd=$(htpasswd -nbB $REGISTRY_USERNAME $REGISTRY_PASSWORD)
