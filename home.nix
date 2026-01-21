# ~/nix-config/home.nix
{ config, pkgs, ... }:

{
  imports = [
   ./modules/git.nix
   ./modules/zsh.nix
   ./modules/neovim.nix
   ./modules/tmux.nix
   ./modules/ghostty.nix
  ];

  # Set your basic home environment variables
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/leonata";

  # This is crucial for managing breaking changes
  home.stateVersion = "24.05";

  # The list of packages you want to have installed.
  home.packages = with pkgs; [
    # Dev essentials
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

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;
}
