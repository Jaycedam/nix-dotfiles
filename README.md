# *NIX Setup

## Description

This is my nix config for macOS (and eventually Linux). 
*It's very early, so only Darwin setup works for now. Check the issues for features missing.*

I'm using Nix package manager with flakes, nix-darwin for macOS deterministic setup and home-manager for software packages and dotfiles.

## Neovim config
All the plugins are installed, loaded and configured within home-manager using Nix. The configuration for each plugin is loaded in lua.

## File structure:
- flake.nix (main flake, right now only sets up darwin configs and calls home-manager)
    - modules/
        - home.nix (home-manager, this is where I install all of the software, currently is a full list, but I want to separate darwin/linux/shared in the future. It makes the config for all my software, including Neovim)
        dotfiles/ (here lives every dotfile config determined in nix language, loaded in home-manager)
