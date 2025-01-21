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

        #testing config
        ##-------------------Style-------------------
    set-option -g status-position top
    set -g status-style fg=default,bg=default
    set-window-option -g window-status-current-style "NONE,fg=#caabff,bg=default"
    setw -g window-status-current-format "#[fg=magenta] [#I] #W #F "
    setw -g window-status-format "[#I] #W"

    set -g status-left "#[bg=brightblack,fg=default,bold] #S " 
    set -g status-right "%b-%d %I:%M   #h "

    # pane
    set -g pane-border-style "fg=#3b4261"
    set -g pane-active-border-style "fg=#82aaff"

    set -g popup-border-lines "rounded"

    #------------------- Keybinds------------------- 
    # Vim-like navigation for panes with Ctrl + h/j/k/l
    # bind -n C-h select-pane -l  # move to the left pane
    # bind -n C-j select-pane -d  # move to the down pane
    # bind -n C-l select-pane -r  # move to the right pane
    # bind -n C-k select-pane -U  # Move to the up pane

    # Open windows/panes on the same directory
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"

    # Easy reload (Useful for testing)
    bind r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config reloaded..."

    bind C-k display-popup -T "Sessions" -E -w 80% -h 80% "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs --no-run-if-empty tmux switch-client -t" 

    # Popups
    bind g popup -T '#[fg=yellow]󰊢 #[fg=default]Lazygit' -d '#{pane_current_path}' -E -w 80% -h 80% lazygit
    bind Enter popup -T 'Disposable Terminal' -d '#{pane_current_path}' -E -w 80% -h 80% zsh # quick disposable terminal
  '';
}
