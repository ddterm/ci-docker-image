FROM registry.fedoraproject.org/fedora:39@sha256:f8e70704052f3bf7fd60376ff1352b6e581686773df47d968bb49af2ec11ae01

RUN dnf update -y && \
    dnf install -y \
        /usr/bin/git \
        /usr/bin/make \
        /usr/bin/meson \
        /usr/bin/glib-compile-schemas \
        /usr/bin/update-desktop-database \
        /usr/bin/gjs \
        /usr/bin/gtk-builder-tool \
        /usr/bin/gtk4-builder-tool \
        /usr/bin/xsltproc \
        /usr/bin/npm \
        /usr/bin/msgfmt \
        /usr/bin/xgettext \
        /usr/bin/msgmerge \
        /usr/bin/msgcmp \
        /usr/bin/desktop-file-validate \
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

# Avoid Mesa errors
ENV LIBGL_ALWAYS_SOFTWARE=true
