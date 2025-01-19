{
  description = "Main Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # darwin
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      username = "jay";

      configuration =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          nixpkgs.config.allowUnfree = true;

          environment.systemPackages = with pkgs; [
            aerospace
            utm
            iina
          ];

          users.users.jay = {
            name = username;
            home = "/Users/jay";
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # darwin config
          security.pam.enableSudoTouchIdAuth = true;

          services = {
            aerospace = {
              enable = true;
            };
          };

          networking = {
            computerName = "Jay's Mac";
            hostName = "Jays-Mac";
            localHostName = "Jays-Mac";
          };

          system = {
            keyboard = {
              enableKeyMapping = true;
              remapCapsLockToEscape = true;
            };

            defaults = {
              WindowManager.EnableTiledWindowMargins = false;
              controlcenter.BatteryShowPercentage = true;
              menuExtraClock.ShowAMPM = false;

              dock = {
                autohide = true;
                autohide-delay = 0.0;
                mru-spaces = false; # Whether to automatically rearrange spaces based on most recent use.
                show-recents = false;
                showhidden = true;
                tilesize = 50;
              };

              screencapture.location = "~/Pictures/Screenshots";
              screensaver = {
                askForPassword = true;
                askForPasswordDelay = 0;
              };

              finder = {
                ShowStatusBar = true;
                _FXSortFoldersFirst = true;
                _FXSortFoldersFirstOnDesktop = true;
                AppleShowAllExtensions = true;
                AppleShowAllFiles = true;
                FXDefaultSearchScope = "SCcf"; # "SCcf" to search current folder.
                FXPreferredViewStyle = "clmv"; # Column View
                FXRemoveOldTrashItems = true; # Remove items in the trash after 30 days.
                NewWindowTarget = "Home";
                ShowPathbar = true;
              };

              NSGlobalDomain = {
                AppleInterfaceStyle = "Dark";
                AppleWindowTabbingMode = "always";
                InitialKeyRepeat = 15;
                KeyRepeat = 2;
                NSAutomaticSpellingCorrectionEnabled = false;
              };
            };
          };

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mac
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            # `home-manager` config
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jay = import ./modules/home.nix;
          }
        ];
      };
    };
}
