# ~/nix-config/home.nix
{ config, pkgs, ... }:

{
  imports = [
   ./modules/zsh.nix
   ./modules/neovim.nix
   ./modules/tmux.nix
  ];
  # Set your basic home environment variables
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/leonata";

  # This is crucial for managing breaking changes
  home.stateVersion = "24.05";

  # The list of packages you want to have installed.
  home.packages = with pkgs; [
    # Dev essentials
    git
    lazygit
    neovim
    ripgrep
    fd
    tree
    tmux
    zoxide
    gh # GitHub CLI
    gemini-cli

    # apps
    alacritty
    aerospace

    ffmpeg
    # General utils
    htop
    eza # A modern `ls`

    uv
    ollama
	
    # Zsh Plugins
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
  ];

  # Program-specific configurations
  programs.git = {
    enable = true;
    userName = "leonatajeff";
    userEmail = "jeffleonata@gmail.com"; # Change this
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;

  # Link Applications to ~/Applications/Nix Apps
  home.activation = {
    linkApplications = ''
      ${pkgs.writeShellScript "link-applications" ''
        set -e
        echo "Linking applications..."
        app_dir="$HOME/Applications/Nix Apps"
        mkdir -p "$app_dir"
        for app in ${pkgs.alacritty}/Applications/* ${pkgs.aerospace}/Applications/*; do
          if [ -e "$app" ]; then
            echo "Linking $app to $app_dir/"
            ln -sf "$app" "$app_dir/"
          fi
        done
        echo "Finished linking applications."
      ''}
    '';
  };
}
