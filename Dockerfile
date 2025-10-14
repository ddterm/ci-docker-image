FROM docker.io/library/fedora:43@sha256:2ad3073554aef41c15b2c52e968ec0540c931bc3dab8c599ca6eb6f32f3f2d14

RUN dnf update -y && \
    dnf install -y \
        /usr/bin/git \
        /usr/bin/make \
        /usr/bin/meson \
        /usr/bin/glib-compile-schemas \
        /usr/bin/gtk-builder-tool \
        /usr/bin/gtk4-builder-tool \
        /usr/bin/xsltproc \
        /usr/bin/npm \
        /usr/bin/msgfmt \
        /usr/bin/xgettext \
        /usr/bin/msgmerge \
        /usr/bin/msgcmp \
        /usr/bin/desktop-file-validate \
        # required by testspace
        /usr/bin/jq \
        /usr/bin/xvfb-run \
        /usr/bin/tox \
        /usr/bin/podman \
        /usr/bin/g++ \
        /usr/bin/pipetty \
        /usr/bin/shellcheck \
        mesa-dri-drivers \
        python3-gobject \
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
