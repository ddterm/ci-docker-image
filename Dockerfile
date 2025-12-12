FROM docker.io/library/fedora:43@sha256:6cd815d862109208adf6040ea13391fe6aeb87a9dc80735c2ab07083fdf5e03a

RUN dnf update -y && \
    dnf install -y \
        /usr/bin/git \
        /usr/bin/make \
        /usr/bin/meson \
        /usr/bin/glib-compile-schemas \
        /usr/bin/gjs \
        /usr/bin/npm \
        /usr/bin/msgfmt \
        /usr/bin/xgettext \
        /usr/bin/msgmerge \
        /usr/bin/msgcmp \
        /usr/bin/desktop-file-validate \
        # required by testspace
        /usr/bin/jq \
        /usr/bin/tox \
        /usr/bin/podman \
        /usr/bin/g++ \
        /usr/bin/pipetty \
        /usr/bin/shellcheck \
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
