#!/bin/sh

NVIM_NIGHTLY_VERSION="pkgver="$(curl -s 'https://api.github.com/repos/neovim/neovim/releases' | jq '.[0].name' | sed 's/NVIM v//; s/-/+/g; s/"//g')

sed -i "/^pkgver=*/c ${NVIM_NIGHTLY_VERSION}" PKGBUILD
makepkg -si
