# NeoVIM Nightly - binary

This is just copy of the AUR package: [NeoVIM nightly bin](https://aur.archlinux.org/packages/neovim-nightly-bin).

I decided to make clone of it because this package is marked out of date and might be deleted from the AUR.

## How to use

1. Clone repo locally
2. `cd` in the folder with `PKGBUILD` file.
3. make `pkgbuild_update.sh` executable (`chmod +x pkgbuild_update.sh`)
4. Run `./pkgbuild_update.sh`

This script:
1. Pulls information about the latest nightly release of NeoVIM
2. Updates `pkgver` parameter in the `PKGBUILD` file.
3. Calls `makepkg -si`:
    - To make new `neovim-nightly-bin` package.
    - And to install it.

## Requirements

1. `curl`
2. `jq`
