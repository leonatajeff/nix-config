# ❄️ Nix Configuration

This repository contains my declarative system and environment configurations managed via [Nix Flakes](https://nixos.wiki/wiki/Flakes) and [Home Manager](https://github.com/nix-community/home-manager). 

It is designed to be highly modular, allowing me to share core terminal utilities across multiple operating systems while maintaining host-specific configurations for macOS, Fedora WSL, and a Proxmox homelab.

## 📂 Repository Structure

The configuration is split into two main concepts: **Hosts** (machine-specific setups) and **Modules** (shared, interchangeable tools).

```text
.
├── flake.nix             # The main switchboard defining inputs and host outputs
├── hosts/                # Machine-specific configurations
│   ├── macos/            # Apple Silicon (aarch64-darwin) setup
│   ├── proxmox/          # Homelab server setup
│   └── wsl-fedora/       # WSL2 Linux (x86_64-linux) setup
└── modules/              # Shared configurations imported a-la-carte
    ├── common.nix        # Core CLI utilities (ripgrep, gh, fd, etc.)
    ├── ghostty.nix       # Terminal emulator config (macOS only)
    ├── git.nix           # Version control identity and aliases
    ├── neovim.nix        # IDE configuration via NixVim
    ├── tmux.nix          # Terminal multiplexer
    └── zsh.nix           # Shell environment and aliases
