#!/bin/sh

NVIM_NIGHTLY_VERSION="pkgver="$(curl -s https://api.github.com/repos/neovim/neovim/releases | jq '.[0].body' | sed 's/\\n/\n/g' | grep NVIM | cut -d' ' -f2)

sed -i "/^pkgver=*/c ${NVIM_NIGHTLY_VERSION}" PKGBUILD
makepkg -si
