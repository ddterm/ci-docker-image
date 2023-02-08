FROM registry.fedoraproject.org/fedora:latest@sha256:b0c61163ff03105c5cce455b01f962e32d79895417bb153894cfa4e135bdb46a

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
        xautomation \
        --nodocs \
        --setopt install_weak_deps=False \
    && dnf clean all -y

VOLUME /var/lib/containers
