{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jay";
  home.homeDirectory = "/Users/jay";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Packages that should be installed to the user profile.
  # TODO: Move spaceific mac/linux to their own flake
  # TODO: Consider moving LSP/Formatters to shells
  home.packages = with pkgs; [
    nodejs_23
    fd
    ffmpeg
    gh
    lazygit
    pure-prompt
    ripgrep
    tldr
    yazi
    yt-dlp
    bun
    gimp
    android-tools
    brave
    localsend
    transmission_4
    # ghostty #broken
    # jellyfin-media-player #broken

    # LSP AND FORMATTERS
    astro-language-server
    taplo
    shfmt
    stylua
    tailwindcss-language-server
    lua-language-server
    marksman
    go
    bash-language-server
    black
    gopls
    nil
    nixfmt-rfc-style
    typescript-language-server
    vscode-langservers-extracted
    prettierd
    djlint
  ];

  programs = {
    zsh = import ./dotfiles/zsh.nix;
    fzf = import ./dotfiles/fzf.nix;
    bat = import ./dotfiles/bat.nix { inherit pkgs; };
    neovim = import ./dotfiles/nvim/nvim.nix { inherit pkgs; };
    ghostty = import ./dotfiles/ghostty.nix; # this does nothing yet since the package is broken
    btop = import ./dotfiles/btop.nix;
    kitty = import ./dotfiles/kitty.nix;
    starship = import ./dotfiles/prompt.nix; # Might change for pure prompt
  };
}
