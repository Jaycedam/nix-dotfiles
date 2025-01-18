{ pkgs, ... }:
{
  enable = true;
  config = {
    theme = "tokyonight";
  };
  themes = {
    tokyonight = {
      src = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "tokyonight.nvim"; # Bat uses sublime syntax for its themes
        rev = "v4.11.0";
        hash = "sha256-pMzk1gRQFA76BCnIEGBRjJ0bQ4YOf3qecaU6Fl/nqLE=";
      };
      file = "extras/sublime/tokyonight_moon.tmTheme";
    };
  };
}
