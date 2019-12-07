# ARM Docker Images

> Note: These builds were run on macOS with docker desktop, I have not attempted to build them elsewhere

## Event Router

```bash
cd event-router

docker build -f Dockerfile \
    --build-arg EVENTROUTER_VERSION="master" \
    -t rebelinblue/eventrouter:v0.3 \
    -t rebelinblue/eventrouter:latest .

docker push rebelinblue/eventrouter
```

## Flux

```bash
cd flux

docker build -f Dockerfile \
    --build-arg FLUX_VERSION="1.16.0" \
    --build-arg KUBECTL_VERSION="v1.14.7" \
    --build-arg KUSTOMIZE_VERSION="v3.2.0" \
    -t rebelinblue/flux:1.16.0 \
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

## Forecastle

```bash
cd forecastle

docker build -f Dockerfile \
    --build-arg FORECASTLE_VERSION="v1.0.36" \
    -t rebelinblue/forecastle:1.0.36 \
    -t rebelinblue/forecastle:latest .

docker push rebelinblue/forecastle
```

## Kubeview

```bash
cd kubeview

docker build -f Dockerfile \
    --build-arg KUBEVIEW_VERSION="0.1.9" \
    -t rebelinblue/kubeview:0.1.9 \
    -t rebelinblue/kubeview:latest .

docker push rebelinblue/kubeview
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

## Speedtest

```bash
cd speedtest

docker build -f Dockerfile \
    -t rebelinblue/speedtest-for-influxdb-and-grafana:latest .

docker push rebelinblue/speedtest-for-influxdb-and-grafana
```

## Traefik Forward Authentication

```bash
cd traefik-forward-auth

docker build -f Dockerfile \
    --build-arg FORWARD_AUTH_VERSION="v2.0.0-rc2" \
    -t rebelinblue/traefik-forward-auth:v2.0.0-rc2 \
    -t rebelinblue/traefik-forward-auth:latest .

docker push rebelinblue/traefik-forward-auth
```

## Vault

```bash
cd vault

docker build -f Dockerfile \
    --build-arg VAULT_VERSION="1.3.0" \
    -t rebelinblue/vault:1.3.0 \
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
    --build-arg VELERO_VERSION="v1.2.0" \
    -t rebelinblue/velero:1.2.0 \
    -t rebelinblue/velero:latest .

docker push rebelinblue/velero
```

## Velero AWS Plug-in
   
```bash
cd velero-plugin-for-aws

docker build -f Dockerfile \
    --build-arg VELERO_AWS_PLUGIN_VERSION="v1.0.0" \
    -t rebelinblue/velero-plugin-for-aws:1.0.0 \
    -t rebelinblue/velero-plugin-for-aws:latest .

docker push rebelinblue/velero-plugin-for-aws
```