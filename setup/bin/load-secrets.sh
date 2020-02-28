#!/bin/bash

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)
source "$REPO_ROOT/setup/.env"

kubectl -n media create secret generic openvpn --from-literal=username=$OPENVPN_USERNAME \
                                               --from-literal=password=$OPENVPN_PASSWORD