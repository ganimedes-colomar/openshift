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
    dpkg \
    && dnf clean all

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/


# Install OpenShift CLI (oc)
RUN curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz \
    && tar -xvf oc.tar.gz \
    && mv oc /usr/local/bin/ \
    && rm oc.tar.gz

# Install MicroShift
RUN curl -LO https://github.com/redhat-et/microshift/releases/latest/download/microshift-linux-amd64 \
    && chmod +x microshift-linux-amd64 \
    && mv microshift-linux-amd64 /usr/local/bin/microshift

# Add setup scripts
COPY setup-microshift.sh /usr/local/bin/setup-microshift.sh
RUN chmod +x /usr/local/bin/setup-microshift.sh
RUN bash /usr/local/bin/setup-microshift.sh

CMD ["/bin/bash"]

