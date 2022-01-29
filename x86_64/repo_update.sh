#!/bin/sh

# Updating neovim package

## removing old one
rm neovim-*tar.zst

## Building new one
cd neovim-nightly-bin/

# NVIM_NIGHTLY_VERSION=$(curl -s 'https://api.github.com/repos/neovim/neovim/releases' | jq '.[0].name' | sed 's/NVIM v//; s/"//g')
NVIM_NIGHTLY_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases | jq '.[0].body' | sed 's/\\n/\n/g' | grep NVIM | cut -d' ' -f2)
NVIM_NIGHTLY_PKG_VERSION="pkgver="$(echo ${NVIM_NIGHTLY_VERSION} | sed 's/-/+/g')
sed -i "/^pkgver=*/c ${NVIM_NIGHTLY_PKG_VERSION}" PKGBUILD
makepkg -s
mv *.zst ../
rm *.tar.gz

# Updating packages db
cd ..

rm alex-arch-repo.db
rm alex-arch-repo.files

repo-add alex-arch-repo.db.tar.gz -R *.zst

rm alex-arch-repo.db
cp alex-arch-repo.db.tar.gz alex-arch-repo.db

rm alex-arch-repo.files
cp alex-arch-repo.files.tar.gz alex-arch-repo.files

# Git add and commit
git add .
git commit -m "NeoVIM Nightly ${NVIM_NIGHTLY_VERSION}"
