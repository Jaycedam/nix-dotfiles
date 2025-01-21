{
  enable = true;
  defaultKeymap = "viins"; # vim keybinds
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  shellAliases = {
    ls = "ls -lhF --color";
    lsa = "ls -lhAF --color";
    v = "nvim";
    so = "source ~/.zshrc";
  };
  history = {
    expireDuplicatesFirst = true;
    ignoreAllDups = true;
    append = true;
  };
  historySubstringSearch = {
    enable = true;
    searchDownKey = [ "^P" ];
    searchUpKey = [ "^N" ];
  };

  # Extra options not available as modules
  # 1. Reduce delay when entering normal mode for vi mode in the shell,
  # 2. CTRL-Z for fzf change directory widget (ALT-C Originally)
  # 3. CTRL-Y [accept suggestion as vim keybind]
  initExtra = ''
    KEYTIMEOUT=1
    bindkey '^Z' fzf-cd-widget
    bindkey '^Y' autosuggest-accept
  '';
}
