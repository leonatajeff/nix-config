# ~/nix-config/modules/zsh.nix
{ config, pkgs, lib, ... }:

{
  xdg.enable = true;

  programs.zsh = {
    enable = true;

    # Keep zsh files out of ~
    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";

      l = "eza -l --color=always --git";
      ls = "eza --color=always";
      la = "eza -la --color=always --git";
      lt = "eza -T --color=always";
    };

    initContent = ''
      # zoxide
      eval "$(${lib.getExe pkgs.zoxide} init zsh)"

      # nice-to-have defaults
      setopt AUTO_CD
      setopt INTERACTIVE_COMMENTS
      setopt HIST_FCNTL_LOCK

      PROMPT='%F{green}%B%n%B%f:%F{blue}%~%f% # '
    '';
  };

  # Put zsh-related packages here so home.nix stays clean
  home.packages = with pkgs; [
    eza
    zoxide

    # If you want completion for lots of stuff:
    zsh-completions
  ];
}
