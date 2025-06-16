FROM docker.io/library/fedora:42@sha256:af97cb7bcca6cbcc42ef41e7c917580c46a237f6e171f51425e8c6080d8d8859

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
        /usr/bin/script \
        /usr/bin/lsdiff \
        colorized-logs \
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
