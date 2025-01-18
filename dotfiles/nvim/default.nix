{ pkgs, ... }:
{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  extraLuaConfig = ''
    ${builtins.readFile ./config/options.lua}
    ${builtins.readFile ./config/keymaps.lua}
  '';

  plugins = with pkgs.vimPlugins; [
    {
      plugin = tokyonight-nvim;
      type = "lua";
      config = "${builtins.readFile ./plugins/colorscheme.lua}";
    }
    {
      plugin = blink-cmp;
      type = "lua";
      config = "${builtins.readFile ./plugins/completion.lua}";
    }
    {
      plugin = conform-nvim;
      type = "lua";
      config = "${builtins.readFile ./plugins/formatter.lua}";
    }
    {
      plugin = fzf-lua;
      type = "lua";
      config = "${builtins.readFile ./plugins/fzf.lua}";
    }
    {
      plugin = nvim-lint;
      type = "lua";
      config = "${builtins.readFile ./plugins/linter.lua}";
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = "${builtins.readFile ./plugins/lsp.lua}";
    }
    # {
    #     plugin = which-key-nvim;
    #     type = "lua";
    #     config = "${builtins.readFile ./plugins/which-key.lua}";
    # }
    # {
    #     plugin = mini-pairs;
    #     type = "lua";
    #     config = "${builtins.readFile ./plugins/pairs.lua}";
    # }
  ];

}
