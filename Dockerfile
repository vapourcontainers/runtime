# syntax=docker/dockerfile:1.4

FROM debian:bookworm

RUN <<EOF
set -eux
echo "deb http://www.deb-multimedia.org bookworm main" >> /etc/apt/sources.list
apt-get update -oAcquire::AllowInsecureRepositories=true
apt-get install -y --allow-unauthenticated --no-install-recommends \
        deb-multimedia-keyring \
        ffmpeg \
        vapoursynth
rm -rf /var/lib/apt/lists/*
EOF
