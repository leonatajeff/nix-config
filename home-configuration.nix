# /Users/jeffleonata/nix-config/home-configuration.nix
{ config, pkgs, ... }:

{
  # IMPORTANT: Specify your macOS username and home directory for Home Manager
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/jeffleonata";

  # List of user-specific packages to install.
  # These are symlinked into ~/.nix-profile/bin and available in your user's PATH.
  home.packages = with pkgs; [
    # General CLI tools
    direnv     # For managing environment variables per-directory
    fzf        # Fuzzy finder
    ripgrep    # Faster grep alternative
    fd         # Faster find alternative
    bat        # Cat clone with syntax highlighting
    lsd        # `ls` replacement (colors, icons, tree view)
    jq         # JSON processor
    yq         # YAML processor (using Python implementation)

    # Database client tools (if you don't need the server, just the clients)
    postgresql # PostgreSQL client tools (e.g., psql)
    # If you need specific PostGIS client utilities, ensure the package name is correct here.
    # Often, the main postgresql package includes common client utilities.

    # Example other programming language tools (uncomment what you need)
    # go
    # rustc
    # python3
  ];

  # Program-specific configurations handled declaratively by Home Manager.
  programs = {
    # Zsh shell configuration
    zsh = {
      enable = true;
      enableCompletion = true;
      # Explicitly enable zsh-autosuggestions and zsh-syntax-highlighting as plugins.
      plugins = [
        { name = "zsh-autosuggestions"; src = pkgs.zsh-autosuggestions; }
        { name = "zsh-syntax-highlighting"; src = pkgs.zsh-syntax-highlighting; }
      ];
      # Add custom environment variables, aliases, or shell hooks.
      initExtra = ''
        export EDITOR="nvim" # Set default editor
        alias ll="ls -laF"   # Common alias for detailed list
        eval "$(direnv hook zsh)" # IMPORTANT: This activates direnv for Zsh
      '';
    };

    # Git configuration
    git = {
      enable = true;
      userName = "Jeff Leonata";         # <--- Your Full Name for Git commits
      userEmail = "jeff.leonata@example.com"; # <--- Your Email for Git commits
      extraConfig = {
        init = { defaultBranch = "main"; }; # Set default branch name for new repos
        # core = { editor = "nvim"; }; # Set Git's default text editor
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
        set -g mouse on # Enable mouse support in tmux
        # Your custom tmux.conf settings go here
      '';
    };

    # Direnv configuration
    direnv = {
      enable = true;
      nix-direnv.enable = true; # Enable the nix-direnv integration
    };
  };

  # This value determines the Home Manager release that your configuration is compatible with.
  # Aligned to "24.11" for consistency with Nixpkgs and nix-darwin.
  home.stateVersion = "24.11";
}
