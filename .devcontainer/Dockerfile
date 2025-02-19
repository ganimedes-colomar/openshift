# Use a Fedora-based image for better compatibility with MicroShift
FROM fedora:latest

# Install dependencies
RUN dnf module enable -y cri-o:1.21 && \
    dnf copr enable -y @redhat-et/microshift
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
    cri-o cri-tools \
    microshift \
    && dnf clean all
RUN firewall-cmd --zone=trusted --add-source=10.42.0.0/16 --permanent && \
    firewall-cmd --zone=public --add-port=80/tcp --permanent && \
    firewall-cmd --zone=public --add-port=443/tcp --permanent && \
    firewall-cmd --zone=public --add-port=5353/udp --permanent && \
    firewall-cmd --reload
RUN systemctl enable crio --now && systemctl enable microshift --now

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/


# Install OpenShift CLI (oc)
RUN curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz \
    && tar -xvf oc.tar.gz \
    && mv oc /usr/local/bin/ \
    && rm oc.tar.gz

RUN mkdir ~/.kube
RUN cat /var/lib/microshift/resources/kubeadmin/kubeconfig > ~/.kube/config

# Add setup scripts
COPY setup-microshift.sh /usr/local/bin/setup-microshift.sh
RUN chmod +x /usr/local/bin/setup-microshift.sh
RUN bash /usr/local/bin/setup-microshift.sh

CMD ["/bin/bash"]

