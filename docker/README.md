# ARM Docker Images

> Note: These builds were run on macOS with docker desktop, I have not attempted to build them elsewhere

## Event Router

```bash
cd event-router

docker build -f Dockerfile \
    --build-arg EVENTROUTER_VERSION="master" \
    -t rebelinblue/eventrouter:0.3 \
    -t rebelinblue/eventrouter:latest .

docker push rebelinblue/eventrouter
```

## Flux

```bash
cd flux

docker build -f Dockerfile \
    --build-arg FLUX_VERSION="1.19.0" \
    --build-arg KUBECTL_VERSION="v1.17.4" \
    --build-arg KUSTOMIZE_VERSION="v3.2.0" \
    --build-arg SOPS_VERSION="v3.5.0" \
    -t rebelinblue/flux:1.19.0 \
    -t rebelinblue/flux:latest .

docker push rebelinblue/flux
```

## Flux Cloud

```bash
cd fluxcloud

docker build -f Dockerfile \
    --build-arg FLUXCLOUD_VERSION="v0.3.9" \
    -t rebelinblue/fluxcloud:0.3.9 \
    -t rebelinblue/fluxcloud:latest .

docker push rebelinblue/fluxcloud
```

## Flux Web - Backend

```bash
cd fluxweb/backend

docker build -f Dockerfile \
    -t rebelinblue/fluxweb-backend:master \
    -t rebelinblue/fluxweb-backend:latest .

docker push rebelinblue/fluxweb-backend
```

## Flux Web - Frontend

```bash
cd fluxweb/frontend

docker build -f Dockerfile \
    -t rebelinblue/fluxweb-frontend:master \
    -t rebelinblue/fluxweb-frontend:latest .

docker push rebelinblue/fluxweb-frontend
```

## Forecastle

```bash
cd forecastle

docker build -f Dockerfile \
    --build-arg FORECASTLE_VERSION="v1.0.42" \
    -t rebelinblue/forecastle:1.0.42 \
    -t rebelinblue/forecastle:latest .

docker push rebelinblue/forecastle
```

## Helm Operator

```bash
cd helm-operator

docker build -f Dockerfile \
    --build-arg KUBECTL_VERSION="v1.17.4" \
    --build-arg HELM_VERSION="v2.16.3" \
    --build-arg HELM3_VERSION="v3.1.2" \
    --build-arg VERSION="1.0.1" \
    -t rebelinblue/helm-operator:1.0.1 \
    -t rebelinblue/helm-operator:latest .

docker push rebelinblue/helm-operator
```

## Kubeview

```bash
cd kubeview

docker build -f Dockerfile \
    --build-arg KUBEVIEW_VERSION="0.1.14" \
    -t rebelinblue/kubeview-arm:0.1.14 \
    -t rebelinblue/kubeview-arm:latest .

docker push rebelinblue/kubeview-arm
```

## Kured

```bash
cd kured

docker build -f Dockerfile \
    --build-arg KUBECTL_VERSION="v1.18.0" \
    --build-arg VERSION="1.4.0" \
    -t rebelinblue/kured:1.4.0 \
    -t rebelinblue/kured:latest .

docker push rebelinblue/kured
```

## Linode Dynamic DNS

```bash
cd linode-dynamic-dns

docker build -f Dockerfile \
    --build-arg DYNDNS_VERSION="0.6.2" \
    -t rebelinblue/linode-dynamic-dns:0.6.2 \
    -t rebelinblue/linode-dynamic-dns:latest .

docker push rebelinblue/linode-dynamic-dns
```

## Popeye

```bash
cd popeye

docker build -f Dockerfile \
    --build-arg POPEYE_VERSION="0.8.3" \
    -t rebelinblue/popeye:v0.8.3 \
    -t rebelinblue/popeye:latest .

docker push rebelinblue/popeye
```

## Traefik Forward Authentication

```bash
cd traefik-forward-auth

docker build -f Dockerfile \
    --build-arg FORWARD_AUTH_VERSION="v2.0.0-rc2" \
    -t rebelinblue/traefik-forward-auth:2.0.0-rc2 \
    -t rebelinblue/traefik-forward-auth:latest .

docker push rebelinblue/traefik-forward-auth
```

## Vault

```bash
cd vault

docker build -f Dockerfile \
    --build-arg VAULT_VERSION="1.4.1" \
    -t rebelinblue/vault:1.4.1 \
    -t rebelinblue/vault:latest .

docker push rebelinblue/vault
```
## Vault Consumer

```bash
cd vault-consumer

docker build -f Dockerfile \
    --build-arg CONFD_VERSION="v0.17.0-dev" \
    -t rebelinblue/vault-consumer:0.0.2 \
    -t rebelinblue/vault-consumer:latest .

docker push rebelinblue/vault-consumer
```

## Velero

```bash
cd velero

docker build -f Dockerfile \
    --build-arg RESTIC_VERSION="0.9.5" \
    --build-arg VELERO_VERSION="v1.3.2" \
    -t rebelinblue/velero:1.3.2 \
    -t rebelinblue/velero:latest .

docker push rebelinblue/velero
```

## Velero FS Freeze

```bash
cd velero-fsfreeze

docker build -f Dockerfile \
    -t rebelinblue/velero-fsfreeze:0.0.1 \
    -t rebelinblue/velero-fsfreeze:latest .

docker push rebelinblue/velero-fsfreeze
```

## Velero AWS Plug-in

```bash
cd velero-plugin-for-aws

docker build -f Dockerfile \
    --build-arg VELERO_AWS_PLUGIN_VERSION="v1.0.1" \
    -t rebelinblue/velero-plugin-for-aws:1.0.1 \
    -t rebelinblue/velero-plugin-for-aws:latest .

docker push rebelinblue/velero-plugin-for-aws
```
