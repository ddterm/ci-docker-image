FROM docker.io/library/fedora:41@sha256:f84a7b765ce09163d11de44452a4b56c1b2f5571b6f640b3b973c6afc4e63212

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
        /usr/bin/g++ \
        /usr/bin/reuse \
        mesa-dri-drivers \
        python3-gobject \
        python3-setproctitle \
        ImageMagick-libs \
        --nodocs \
        --setopt install_weak_deps=False \
    && dnf clean all -y

RUN adduser -d /home/github-actions -m -u 1042 -U -G users,adm github-actions \
    && echo "ALL ALL=NOPASSWD: ALL" >/etc/sudoers.d/nopasswd \
    && chmod u+rw /etc/shadow \
    && rpm --setcaps shadow-utils

VOLUME /var/lib/containers
VOLUME /home/github-actions

# Avoid D-Bus access
ENV GTK_A11Y=none

# Avoid Mesa errors
ENV LIBGL_ALWAYS_SOFTWARE=true
