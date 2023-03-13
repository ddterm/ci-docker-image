FROM registry.fedoraproject.org/fedora:latest@sha256:d61102cd2dfcb5ac29f752554c8738631245acefb02cae741562349a471fc4d3

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
