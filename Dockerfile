FROM registry.fedoraproject.org/fedora:36

RUN dnf update -y && \
    dnf install -y \
        gtk3-devel \
        gtk4-devel \
        libxslt \
        gnome-shell \
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
        unzip \
        podman \
        python3-gobject \
        tox \
        ImageMagick-libs \
        --nodocs \
        --setopt install_weak_deps=False \
    && dnf clean all -y

VOLUME /var/lib/containers
