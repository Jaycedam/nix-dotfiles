{
  # enable = true;
  settings = {
    theme = "tokyonight_moon";
    background = "#111111";
    font-size = 14;
    mouse-hide-while-typing = "true";
    macos-titlebar-style = "tabs";
    window-save-state = "always";
    window-new-tab-position = "end";
    quick-terminal-position = "center";
    # quick-terminal-size = 80%,80%; PR not merged yet
    # Keybinds
    # super+enter was originally fullscreen, but macOS has a native keybind for that "fn+f"
    keybind = "global:super+enter=toggle_quick_terminal";
  };
}
