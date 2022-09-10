FROM registry.fedoraproject.org/fedora:36@sha256:e9b9d4ae36aa1ee0ee7b4b7fc6f470e24e3b473ac2cfb9c1abde2b8fb2500b99

RUN dnf update -y && \
    dnf install -y \
        gtk3-devel \
        gtk4-devel \
        libxslt \
        make \
        npm \
        xorg-x11-server-Xvfb \
        mesa-dri-drivers \
        git \
        xdotool \
        xautomation \
        sudo \
        patch \
        jq \
        zip \
        unzip \
        podman \
        python3-gobject \
        tox \
        ImageMagick-libs \
        --nodocs \
        --setopt install_weak_deps=False \
    && dnf clean all -y

VOLUME /var/lib/containers
