#!/bin/bash
set -e

echo "📦 Setting up MicroShift (OpenShift)..."

# Start MicroShift
microshift &

# Wait for MicroShift to initialize
echo "⏳ Waiting for MicroShift to start..."
sleep 20

# Verify cluster status
echo "✅ MicroShift cluster is running!"
oc status

