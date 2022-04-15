FROM registry.fedoraproject.org/fedora:35

RUN dnf update -y && \
    dnf install -y \
    gtk3-devel gtk4-devel libxslt gnome-shell make npm xorg-x11-server-Xvfb git \
    xdotool xautomation sudo patch jq unzip podman python3-gobject tox ImageMagick-libs

VOLUME /var/lib/containers
