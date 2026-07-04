#!/usr/bin/env bash
set -e
sudo apt update
sudo apt install -y xpra xvfb xterm wget
if ! command -v google-chrome >/dev/null; then
 wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
 sudo apt install -y ./google-chrome-stable_current_amd64.deb
fi
echo Installed
