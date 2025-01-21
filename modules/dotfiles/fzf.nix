{
  enable = true;
  tmux = {
    enableShellIntegration = true;
    shellIntegrationOptions = [
      "-p 80%"
    ];
  };
  colors = {
    "bg+" = "#2d3f76";
    "border" = "#589ed7";
    "fg" = "#c8d3f5";
    "gutter" = "#1e2030";
    "header" = "#ff966c";
    "hl+" = "#65bcff";
    "hl" = "#65bcff";
    "info" = "#545c7e";
    "marker" = "#ff007c";
    "pointer" = "#ff007c";
    "prompt" = "#65bcff";
    "query" = "#c8d3f5:regular";
    "scrollbar" = "#589ed7";
    "separator" = "#ff966c";
    "spinner" = "#ff007c";
  };

  defaultOptions = [
    "--bind 'ctrl-y:accept'"
    "--info=inline-right"
    "--highlight-line"
    "--height 80%"
    "--layout=reverse-list"
    "--color=bg+:#2d3f76"
    "--color=border:#589ed7"
    "--color=fg:#c8d3f5"
    "--color=gutter:#1e2030"
    "--color=header:#ff966c"
    "--color=hl+:#65bcff"
    "--color=hl:#65bcff"
    "--color=info:#545c7e"
    "--color=marker:#ff007c"
    "--color=pointer:#ff007c"
    "--color=prompt:#65bcff"
    "--color=query:#c8d3f5:regular"
    "--color=scrollbar:#589ed7"
    "--color=separator:#ff966c"
    "--color=spinner:#ff007c"
  ];

  # OPTION-T shortcut to change directory: exclude folders, preview with bat
  fileWidgetOptions = [
    "--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash"
    "--preview 'bat -n --color=always {}'"
  ];

  # OPTION-C shortcut to change directory: exclude folders
  changeDirWidgetOptions = [
    "--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash"
  ];

  # CTRL-R shortcut to search command history: CTRL-Y to copy the command into clipboard using pbcopy
  historyWidgetOptions = [
    "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
    "--color header:bold"
    "--header 'Press CTRL-Y to copy command into clipboard'"
  ];
}
