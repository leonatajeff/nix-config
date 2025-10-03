# ~/nix-config/modules/zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # Use the ZDOTDIR to keep the home directory clean
    dotDir = ".config/zsh";

    # Sensible history configuration
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true; # Share history between all sessions
    };

    # Shell aliases
    shellAliases = {
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      # Listing files with eza (which you already have)
      l = "eza -l --color=always --git";
      ls = "eza --color=always";
      la = "eza -la --color=always --git";
      lt = "eza -T --color=always";
    };

    # Oh My Zsh provides a solid plugin management framework
    oh-my-zsh = {
      enable = true;
      # This is the secret to using Powerlevel10k with Oh My Zsh
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-completions" # Adds many useful completions
      ];
    };

    # This is the escape hatch for anything not covered by a Nix option.
    # We use it to initialize zoxide and powerlevel10k.
    initExtra = ''
      # Initialize zoxide (which you already have installed)
      eval "$(zoxide init zsh)"

      # Powerlevel10k's configuration wizard creates this file.
      # This line sources it if it exists.
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  # Set your default shell
  programs.home-manager.sharedModules = [{
    users.users.${config.home.username}.shell = pkgs.zsh;
  }];
}
