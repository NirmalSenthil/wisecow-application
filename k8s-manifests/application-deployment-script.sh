#!/bin/bash

set -e

# Create deployment and namespace
kubectl apply -f deployment.yaml

# Create secret for ingress SSL/TLS certificate
kubectl create secret tls wisecow-tls --cert=tls.crt --key=tls.key -n wisecow || echo "Secret already exists"

# Create service
kubectl apply -f service.yaml

# Wait for the service to be created and available
echo "Waiting for Service creation..."
#kubectl wait --namespace wisecow --for=condition=complete --timeout=300s service/wisecow-service
kubectl wait --namespace wisecow --for=jsonpath='{.status.loadBalancer.ingress}' service/wisecow-service

# Create ingress for secure connection
kubectl apply -f ingress.yaml

