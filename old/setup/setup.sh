#!/bin/sh

e_header() {
    export CLI_MAGENTA=$(tput -Txterm-256color setaf 5)
    export CLI_BOLD=$(tput -Txterm-256color bold)
    export CLI_RESET=$(tput -Txterm-256color sgr0)

    printf "\n${CLI_BOLD}${CLI_MAGENTA}==========  %s  ==========${CLI_RESET}\n" "$@"
}

e_header "Creating namespaces"
kubectl apply -f namespaces.yaml

kubectl taint nodes master node-role.kubernetes.io/master="":NoSchedule

# Linode token
#kubectl -n infra create secret generic linode-dynamic-dns --from-literal='token=token'
#kubectl -n infra delete secret linode-dynamic-dns

#htpasswd -nb stephen password
#kubectl -n infra create secret generic dashboards-auth --from-literal='auth=authstring'
#kubectl get secret dashboards-auth --namespace=infra --export -o yaml | kubectl apply --namespace=logging -f -
#kubectl get secret dashboards-auth --namespace=infra --export -o yaml | kubectl apply --namespace=monitoring -f -
#kubectl get secret dashboards-auth --namespace=infra --export -o yaml | kubectl apply --namespace=apps -f -
#kubectl get secret dashboards-auth --namespace=infra --export -o yaml | kubectl apply --namespace=vault -f -
#kubectl -n apps delete secret dashboards-auth
#kubectl -n infra delete secret dashboards-auth
#kubectl -n logging delete secret dashboards-auth
#kubectl -n monitoring delete secret dashboards-auth
#kubectl -n vault delete secret dashboards-auth

e_header "Installing NFS Storage"
kubectl -n infra apply -f 1-NFS_Storage/
kubectl -n infra patch storageclass nfs-hdd -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl -n infra patch deployment nfs-client-provisioner -n infra --patch '{"spec": {"template": {"spec": {"nodeSelector": {"beta.kubernetes.io/arch": "arm"}}}}}'

#e_header "Installing ExternalDNS"
#kubectl -n infra apply -f 2-ExternalDNS/

e_header "Installing Traefik"
kubectl -n infra apply -f 3-Traefik/

e_header "Installing Kubernetes Dashboard"
kubectl -n kubernetes-dashboard apply -f 4-Dashboard/

e_header "Installing Metrics Server"
kubectl -n kube-system apply -f 5-Metrics-server/

e_header "Installing Cert Manager"
kubectl apply -f 6-CertManager/

e_header "Installing Loki & Promtail"
kubectl -n logging create configmap promtail --from-file=7-Logging/promtail/
kubectl -n logging apply -f 7-Logging/loki.yaml
kubectl -n logging apply -f 7-Logging/promtail.yaml

e_header "Installing Event Router"
kubectl -n kube-system apply -f 7-Logging/eventrouter.yaml

e_header "Installing Node Exporter"
kubectl -n kube-system apply -f 8-Monitoring/node-exporter.yaml

e_header "Installing Kube State Metrics"
kubectl -n kube-system apply -f 8-Monitoring/kube-state-metrics.yaml

e_header "Installing Blackbox Exporter"
kubectl -n monitoring apply -f 8-Monitoring/blackbox-exporter.yaml

e_header "Installing Prometheus & Alert Manager"
kubectl -n monitoring create configmap prometheus-config --from-file=8-Monitoring/prometheus/
kubectl -n monitoring apply -f 8-Monitoring/alertmanager.yaml
kubectl -n monitoring apply -f 8-Monitoring/prometheus.yaml

e_header "Installing Grafana"
kubectl -n monitoring apply -f 8-Monitoring/grafana.yaml

e_header "Installing Consul"
kubectl -n vault apply -f 9-Secrets/consul.yaml

e_header "Installing Vault"
kubectl -n vault create secret generic vault-unseal-keys --from-literal="VAULT_UNSEAL_KEY_1=?" \
                                                         --from-literal="VAULT_UNSEAL_KEY_2=?" \
                                                         --from-literal="VAULT_UNSEAL_KEY_3=?" \
                                                         --from-literal="VAULT_UNSEAL_KEY_4=?" \
                                                         --from-literal="VAULT_UNSEAL_KEY_5=?"
kubectl -n vault apply -f 9-Secrets/vault.yaml

e_header "Installing Forecastle"
kubectl -n apps apply -f 10-Others/forecastle.yaml
kubectl apply -f 10-Others/forecastle/

e_header "Installing Kubeview"
kubectl -n apps apply -f 10-Others/kubeview.yaml

e_header "Installing Linode Dynamic DNS update"
kubectl -n infra apply -f 10-Others/dyndns.yaml

e_header "Getting Dashboard Token"
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

# kubectl get --export -o yaml --all-namespaces issuer,clusterissuer,certificates,orders,challenges,certificaterequests > cert-manager-backup.yaml
# kubectl get --field-selector type="kubernetes.io/tls" --export -o yaml --all-namespaces secrets >> cert-manager-backup.yaml