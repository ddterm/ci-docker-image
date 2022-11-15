FROM registry.fedoraproject.org/fedora:37@sha256:cb658f76e3a647535b8020bc1c272222f6541b87221f25cf9ee936d0b16fa8ea

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
