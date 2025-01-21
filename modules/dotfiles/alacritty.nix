{
  enable = true;
  settings = {

    window = {
      decorations = "buttonless";
      # padding = {
      #   x = 4;
      #   y = 4;
      # };
      dynamic_padding = true;

      startup_mode = "Fullscreen";
    };

    font = {
      normal.family = "JetBrainsMonoNL Nerd Font";
      size = 16;
    };

    env = {
      TERM = "xterm-256color";
    };

    mouse = {
      hide_when_typing = true;
    };

    colors = {
      primary = {
        background = "#111111";
        foreground = "#c8d3f5";
      };

      cursor = {
        text = "#222436";
        cursor = "#c8d3f5";
      };

      normal = {
        black = "#1b1d2b";
        red = "#ff757f";
        green = "#c3e88d";
        yellow = "#ffc777";
        blue = "#82aaff";
        magenta = "#c099ff";
        cyan = "#86e1fc";
        white = "#828bb8";
      };

      bright = {

        black = "#444a73";
        red = "#ff8d94";
        green = "#c7fb6d";
        yellow = "#ffd8ab";
        blue = "#9ab8ff";
        magenta = "#caabff";
        cyan = "#b2ebff";
        white = "#c8d3f5";
      };

      indexed_colors = [
        {
          index = 16;
          color = "#ff966c";
        }
        {
          index = 17;
          color = "#c53b53";
        }
      ];
    };
  };
}
