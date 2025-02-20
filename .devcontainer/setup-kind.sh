#!/bin/bash
set -e

echo "📦 Setting up kind cluster..."

# Create a multi-node Kubernetes cluster
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF

echo "✅ Kind cluster setup complete!"
kubectl get nodes

