# Use a Fedora-based image for better compatibility with MicroShift
FROM fedora:latest

# Install dependencies
RUN dnf install -y \
    curl \
    sudo \
    bash-completion \
    jq \
    iproute \
    iputils \
    iptables \
    selinux-policy-targeted \
    conntrack-tools \
    && dnf clean all

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.32.2/bin/linux/amd64/kubectl"     && chmod +x kubectl     && mv kubectl /usr/local/bin/

# Install kind (for Kubernetes)
RUN curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64     && chmod +x /usr/local/bin/kind

# Install Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Add setup scripts
COPY setup-kind.sh /usr/local/bin/setup-kind.sh
RUN chmod +x /usr/local/bin/setup-kind.sh 

CMD ["/bin/bash"]
