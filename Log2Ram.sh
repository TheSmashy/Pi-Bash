#!/usr/bin/env bash

if [[ ! -f /etc/apt/sources.list.d/azlux.list ]]; then
  echo "[+] Adding azlux log2ram repo …"

  # Load distro info (VERSION_CODENAME)
  . /etc/os-release

  # Import keyring
  sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg https://azlux.fr/repo.gpg

  # Add repo using correct VERSION_CODENAME (bookworm on Pi)
  echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ ${VERSION_CODENAME} main" \
    | sudo tee /etc/apt/sources.list.d/azlux.list
fi

apt update
apt install log2ram -y
