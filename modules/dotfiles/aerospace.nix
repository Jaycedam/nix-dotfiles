{
  enable = true;
  settings = {
    gaps = {
      inner.horizontal = 8;
      inner.vertical = 8;
      outer.left = 8;
      outer.bottom = 8;
      outer.top = 8;
      outer.right = 8;
    };
    mode.main.binding = {
      # focus
      alt-h = "focus left";
      alt-j = "focus down";
      alt-k = "focus up";
      alt-l = "focus right";
      # move
      alt-shift-h = "move left";
      alt-shift-j = "move down";
      alt-shift-k = "move up";
      alt-shift-l = "move right";
      #resize
      alt-0 = "resize smart -50";
      alt-equal = "resize smart +50";
      #layout
      alt-comma = "layout accordion horizontal vertical";
      #workspace
      alt-b = "workspace B"; # Browser
      alt-t = "workspace T"; # Terminal
      alt-m = "workspace M"; # Media
      alt-c = "workspace C"; # Chat
      # move node to workspace
      alt-shift-b = "move-node-to-workspace B"; # Browser
      alt-shift-t = "move-node-to-workspace T"; # Terminal
      alt-shift-m = "move-node-to-workspace M"; # Media
      alt-shift-c = "move-node-to-workspace C"; # Chat
      # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
      alt-tab = "workspace-back-and-forth";
      # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
      alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
    };

  };
}
