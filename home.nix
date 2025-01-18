{
        config,
                pkgs,
                lib,
                ...
}: let
inherit (config.lib.file) mkOutOfStoreSymlink;
in {
# Let Home Manager install and manage itself.
        programs.home-manager.enable = true;

# Home Manager needs a bit of information about you and the
# paths it should manage.
        home.username = "jay";
        home.homeDirectory = "/Users/jay";

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
        home.stateVersion = "24.11";

# Packages that should be installed to the user profile.
        home.packages = with pkgs; [
                nodejs_23
                        bash-language-server
                        black
                        btop
                        fd
                        ffmpeg
                        gh
                        go
                        gopls
                        lazygit
                        lua-language-server
                        marksman
                        prettierd
                        pure-prompt
                        ripgrep
                        shfmt
                        stylua
                        tailwindcss-language-server
                        taplo
                        tldr
                        typescript-language-server
                        vscode-langservers-extracted
                        yazi
                        yt-dlp
                        bun
                        gimp
                        android-tools
                        brave
                        # ghostty #broken
                        iina
                        # jellyfin-media-player #broken
                        localsend
                        transmission_4
                        utm
                        ];


        programs = {
                zsh = {
                        enable = true;
                        defaultKeymap = "viins"; # vim keybinds
                                autosuggestion.enable = true;
                        syntaxHighlighting.enable = true;
                        shellAliases = {
                                ls = "ls -lhF --color";
                                lsa="ls -lhAF --color";
                                v="nvim";
                                so="source ~/.zshrc";
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
			# 1. reduce delay when entering normal mode for vi mode in the shell,
			# 2. fixes CTRL-C shortcut for fzf in non US layouts
			initExtra = "KEYTIMEOUT=1\nbindkey 'ç' fzf-cd-widget";
                };

		starship = {
		enable = true;
		};

                fzf = {
                        enable = true;
                        colors = {
                                "bg+"="#2d3f76";
                                "border"="#589ed7";
                                "fg"="#c8d3f5";
                                "gutter"="#1e2030";
                                "header"="#ff966c";
                                "hl+"="#65bcff";
                                "hl"="#65bcff";
                                "info"="#545c7e";
                                "marker"="#ff007c";
                                "pointer"="#ff007c";
                                "prompt"="#65bcff";
                                "query"="#c8d3f5:regular";
                                "scrollbar"="#589ed7";
                                "separator"="#ff966c";
                                "spinner"="#ff007c";
                        };

			defaultOptions = [
					"--bind 'ctrl-y:accept'"
					"--highlight-line"
					"--height 90%"
					"--info=inline-right"
					"--layout=reverse-list"
					"--border=none"
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
		};

		bat = {
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
		};

		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;

		};

		ghostty = {
			settings = {
				theme = "tokyonight_moon";
#background = #111111;

				font-size = 14;
				mouse-hide-while-typing = "true";
				macos-titlebar-style = "tabs";
				window-save-state = "always";
				window-new-tab-position = "end";

# change to "center" when this issue about the quick terminal size is closed https://github.com/ghostty-org/ghostty/issues/2384
				quick-terminal-position = "center";
# quick-terminal-size = 80%,80%;

# Keybinds
# super+enter was originally fullscreen, but macOS has a native keybind for that "fn+f"
				keybind = "global:super+enter=toggle_quick_terminal";
			};
		};


	};
}
