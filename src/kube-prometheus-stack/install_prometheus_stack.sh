#!/bin/bash

helm install monitoring -f values.yaml oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --create-namespace -n monitoring

kubectl apply -f grafana-ingress.yaml

echo "Grafana pass:"
kubectl --namespace monitoring get secrets monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo