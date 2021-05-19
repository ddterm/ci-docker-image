FROM fedora:34
RUN dnf install -y gtk3-devel gtk4-devel libxslt gnome-shell make npm xorg-x11-server-Xvfb git
RUN npm install -g eslint
