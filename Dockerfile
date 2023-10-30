FROM registry.fedoraproject.org/fedora:39@sha256:4887c132c56ecada47275f0e3d6a6f949322c81ec34a9fb29b6f8356583509fa

RUN dnf update -y && \
    dnf install -y \
        /usr/bin/git \
        /usr/bin/make \
        /usr/bin/gjs \
        /usr/bin/gtk-builder-tool \
        /usr/bin/gtk4-builder-tool \
        /usr/bin/xsltproc \
        /usr/bin/npm \
        /usr/bin/msgfmt \
        /usr/bin/xgettext \
        /usr/bin/msgmerge \
        /usr/bin/msgcmp \
        /usr/bin/patch \
        /usr/bin/diff \
        /usr/bin/jq \
        /usr/bin/zip \
        /usr/bin/unzip \
        /usr/bin/xvfb-run \
        /usr/bin/tox \
        /usr/bin/podman \
        mesa-dri-drivers \
        python3-gobject \
        ImageMagick-libs \
        --nodocs \
        --setopt install_weak_deps=False \
    && dnf clean all -y

VOLUME /var/lib/containers

# Avoid D-Bus access
ENV GTK_A11Y=none
