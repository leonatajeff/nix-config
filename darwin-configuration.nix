# /Users/jeffleonata/nix-config/darwin-configuration.nix
{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System-wide packages.
  environment.systemPackages = with pkgs; [
    alacritty
    lazygit
    neovim
    git
    curl
    tmux
    mkalias # Needed for your /Applications setup
    nodejs_20
    vscode
    yarn
    tree
    prettierd
    corepack
    aerospace
    ffmpeg
    kubectl
    docker
    awscli2
  ];

  # Your custom application activation script for /Applications/Nix Apps
  system.activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
  in
      pkgs.lib.mkForce ''
        echo "Setting up /Applications/Nix Apps..." >&2
        rm -rf "/Applications/Nix Apps"
        mkdir -p "/Applications/Nix Apps"

        find ${env}/Applications -maxdepth 1 -type d -name "*.app" -exec ${pkgs.mkalias}/bin/mkalias "{}" "/Applications/Nix Apps/$(basename {})" \;
      '';

  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    # Add more system defaults here as needed
    # NSGlobalDomain.AppleInterfaceStyle = "Dark"; # Example: Dark Mode
  };

  # Essential Nix settings for flakes
  nix.settings.experimental-features = "nix-command flakes";

  # Enable Nix daemon management by nix-darwin
  services.nix-daemon.enable = true;

  # Zsh configuration.
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];
  environment.loginShell = "${pkgs.zsh}/bin/zsh";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = config.self.rev or config.self.dirtyRev or null;

  # Used for backwards compatibility in nix-darwin.
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin"; # Confirm this for your Mac
}
