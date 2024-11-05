#!/bin/bash

set -ex

mount --make-rshared /
CGROUP="$(grep '^0::' /proc/self/cgroup)"
chown -R github-actions:github-actions "/sys/fs/cgroup${CGROUP#0::}"

sudo --preserve-env --set-home --user=github-actions -- podman run --rm alpine:latest true
