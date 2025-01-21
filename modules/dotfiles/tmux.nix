{
  enable = true;
  escapeTime = 0;
  focusEvents = true;
  historyLimit = 50000;
  mouse = true;
  baseIndex = 1;
  disableConfirmationPrompt = true;
  prefix = "C-Space";
  keyMode = "vi";
  # prefix = "C-a";
  terminal = "$TERM";
  extraConfig = ''
    set -ag terminal-overrides ",$TERM:Tc"

    #testing file
    source-file ~/.config/tmux/test.conf
  '';
}
