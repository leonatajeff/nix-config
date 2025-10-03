# /Users/jeffleonata/nix-config/home-configuration.nix
{ config, pkgs, ... }:

{
  # Specify your macOS username and home directory for Home Manager
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/jeffleonata";

  # User-specific packages (CLI tools, programming language runtimes, etc.)
  home.packages = with pkgs; [
    # General CLI tools (some from your original systemPackages)
    direnv # For project-specific environments
    fzf
    ripgrep
    fd
    bat
    lsd
    jq
    yq

    # Database client tools
    postgresql # PostgreSQL client tools (e.g., psql)
    # If you need specific postgis client tools (not the server):
    # postgis # This package usually contains the client utilities
    # If using postgresql16Packages.postgis client utilities, verify its name/availability here.
    # Often, the main postgresql package is sufficient for basic client needs.

    # Example other tools:
    # go
    # rustc
    # python3
  ];

  # Program-specific configurations
  programs = {
    # Zsh configuration managed by Home Manager
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        export EDITOR="nvim"
        alias ll="ls -laF"
        eval "$(direnv hook zsh)" # Crucial for direnv integration
      '';
      # You can add zsh plugins here if desired:
      # plugins = [
      #   { name = "zsh-autosuggestions"; src = pkgs.zsh-autosuggestions; }
      #   { name = "zsh-syntax-highlighting"; src = pkgs.zsh-syntax-highlighting; }
      # ];
    };

    # Git configuration
    git = {
      enable = true;
      userName = "Jeff Leonata";
      userEmail = "jeff.leonata@example.com";
      extraConfig = {
        init = { defaultBranch = "main"; };
        # core = { editor = "nvim"; };
      };
    };

    # Neovim configuration (if you installed it via home.packages)
    neovim = {
      enable = true;
      defaultEditor = true; # Make nvim the default system editor
      # You can manage plugins, themes, and settings declaratively here.
      # plugins = with pkgs.vimPlugins; [
      #   telescope-nvim
      # ];
      # extraConfig = ''
      #   set number
      # '';
    };

    # Tmux configuration (if you installed it via home.packages)
    tmux = {
      enable = true;
      extraConfig = ''
        set -g mouse on
        # Your custom tmux.conf settings
      '';
    };

    # Direnv configuration
    direnv = {
      enable = true;
      nix-direnv.enable = true; # Enable the nix-direnv integration
    };
  };

  # This value determines the Home Manager release that your configuration is compatible with.
  # Match it with the Nixpkgs version or a recent stable version.
  home.stateVersion = "24.11"; # Or "24.05" for a newer release, etc.
}
