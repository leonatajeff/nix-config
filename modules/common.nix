# ~/nix-config/modules/common.nix
{ pkgs, ... }:

{
  # The list of packages you want installed on ALL your machines (WSL, Mac, etc.)
  home.packages = with pkgs; [
    # Development essentials
    lazygit
    ripgrep
    fd
    tree
    tmux
    neovim
    nodejs_24
    uv

    # General utilities
    htop
    wget
    unzip

    bat       # A better 'cat' with syntax highlighting
    eza       # A better 'ls'
    fzf       # A command-line fuzzy finder
    jq        # A lightweight JSON processor
  ];
}
