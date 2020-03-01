# Deployments Not Using HelmRelease

- **flux**
    - **flux** - Using chart but not helm operator
    - **flux-cloud** - No chart exists
    - **helm-operator** - Using chart but not helm operator
- **infra**
    - **linode-dynamic-dns** - Custom app
    - **minio** - Doesn't support initContainer
    - **traefik-forward-auth** - No chart exists
- **kube-system**
    - **kured** - Doesn't support initContainer
- **kubernetes-dashboard**
    - **dashboard** - Chart is for v1
- **media**
    - **plex**
    - **tautulli**
- **monitoring**
    - **alertmanager** - Doesn't support initContainer
    - **prometheus**
- **vault**
    - **vault** - Custom app
    

