FROM registry.fedoraproject.org/fedora:latest@sha256:176454f0e89d7bda8b8b577bfd855f5cb3854234d781855baef82cb057b0529e

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
        diffutils \
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
