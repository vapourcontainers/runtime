# syntax=docker/dockerfile:1.4

FROM debian:bookworm

RUN <<EOF
echo "deb http://www.deb-multimedia.org bookworm main" >> /etc/apt/sources.list
apt-get update -oAcquire::AllowInsecureRepositories=true
apt-get install -y --allow-unauthenticated --no-install-recommends deb-multimedia-keyring vapoursynth ffmpeg
apt-get autoremove -y --purge
apt-get clean
rm -rf /var/lib/apt/lists/*
mkdir -p $HOME/.config/vapoursynth
echo "UserPluginDir=/usr/local/lib/vapoursynth" > $HOME/.config/vapoursynth/vapoursynth.conf
EOF
