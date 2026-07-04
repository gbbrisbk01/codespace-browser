#!/usr/bin/env bash
set -e
DISPLAY_NUM=101;PORT=14500
export XDG_RUNTIME_DIR=/tmp/runtime-$USER
mkdir -p "$XDG_RUNTIME_DIR";chmod 700 "$XDG_RUNTIME_DIR"
pkill -9 xpra||true;pkill -9 Xvfb||true;pkill -9 google-chrome||true
rm -f /tmp/.X${DISPLAY_NUM}-lock;rm -rf /tmp/.X11-unix/X${DISPLAY_NUM}
xpra start :${DISPLAY_NUM} --xvfb="Xvfb +extension GLX -screen 0 1920x1080x24" --bind-tcp=0.0.0.0:${PORT} --html=on --daemon=yes --mdns=no --start-child="/usr/bin/google-chrome --no-sandbox --disable-dev-shm-usage --disable-gpu --user-data-dir=/tmp/chrome-profile"
xpra list
ss -ltnp|grep ${PORT}||true
