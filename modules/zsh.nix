# ~/nix-config/modules/zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # Use the ZDOTDIR to keep the home directory clean
    dotDir = "${config.xdg.configHome}/zsh";
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
      plugins = [
        "git"
      ];
    };

    # This is the escape hatch for anything not covered by a Nix option.
    # We use it to initialize zoxide and powerlevel10k.
initContent = ''
  # Initialize zoxide
  eval "$(zoxide init zsh)"

  # Source Nix environment if present
  if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  fi

  # Powerlevel10k's configuration wizard creates this file.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
'';
  };
}
