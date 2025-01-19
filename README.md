# *NIX Setup

## Description

This is my nix config for macOS (and eventually Linux). 

*It's very early, so only Darwin setup works for now. Check the issues for features missing.*

I'm using Nix package manager with flakes, nix-darwin for macOS deterministic setup and home-manager for software packages and dotfiles.

## Neovim config
All the plugins are installed, loaded and configured within home-manager using Nix. The configuration for each plugin is loaded in lua.

## Setup

1. Install Nix:
```bash
sh <(curl -L https://nixos.org/nix/install)
```

2. Restart the shell by opening a new tab or restarting the terminal. 
Then start a temporary shell with git and install nix-darwin:
```bash
nix-shell -p git
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/Developer/nix#mac
```

3. Apply the config:
```bash
darwin-rebuild switch --flake ~/Developer/nix#mac
```

4. Restart or logout for changes to take effect.
