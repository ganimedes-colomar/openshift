#!/bin/bash
set -e

echo "📦 Setting up k3d cluster..."

# Create a multi-node Kubernetes cluster
k3d cluster create multinode --agents 2 --servers 1

echo "✅ k3d cluster setup complete!"
kubectl get nodes

