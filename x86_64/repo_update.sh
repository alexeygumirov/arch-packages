#!/bin/sh

# Updating neovim package
cd neovim-nightly-bin/

NVIM_NIGHTLY_VERSION="pkgver="$(curl -s 'https://api.github.com/repos/neovim/neovim/releases' | jq '.[0].name' | sed 's/NVIM v//; s/-/+/g; s/"//g')
sed -i "/^pkgver=*/c ${NVIM_NIGHTLY_VERSION}" PKGBUILD
makepkg -s

# Updating packages db
cd ..

rm alex-arch-repo.db
rm alex-arch-repo.files

mv $(/bin/ls -1 --sort=time neovim-nightly-bin/*.zst | head -n1) .
repo-add alex-arch-repo.db.tar.gz -R $(/bin/ls -1 --sort=time neovim-nightly-bin-*.zst)

rm alex-arch-repo.db
cp alex-arch-repo.db.tar.gz alex-arch-repo.db

rm alex-arch-repo.files
cp alex-arch-repo.files.tar.gz alex-arch-repo.files
