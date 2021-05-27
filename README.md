# arch-packages
My packages for Arch which are either not updated or even removed from AUR.

# How to use

1. Add in your '/etc/pacman.conf' following lines (in the end):

```conf
[alex-arch-repo]
SigLevel = Optional TrustAll
Server = https://raw.githubusercontent.com/alexeygumirov/arch-packages/main/x86_64
```

2. Run `pacman -Syy` or `paru -Syy` or `yay -Syy`.

Now you can install:

- **NeoVIM nightly** builds: `pacman -S neovim-nightly-bin` or `paru -S neovim-nightly-bin` or `yay -S neovim-nightly-bin`.
- **slock-bgimage**:`pacman -S slock-bgimage` or `paru -S slock-bgimage` or `yay -S slock-bgimage`.
