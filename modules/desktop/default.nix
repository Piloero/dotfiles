{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  unstablePackages = with pkgs-unstable; [
    ghostty
    vscode
  ];

  stablePackages = with pkgs; [
    duckdb
    gimp

    obsidian
    pkgs-unstable.signal-desktop

    keepassxc

    usbimager

    libwacom
    xf86_input_wacom

    # kdePackages.okular
    scribus
    xournalpp
    naps2

    audacity

    rustdesk
  ];
in
{
  imports = [
    ./hyprland.nix
    ./keyboard.nix
    ./x11-desktop-env.nix
    # APPS
    ./apps/jetbrains.nix
    # ./apps/kanata.nix
    ./apps/sync_files.nix
    ./apps/web.nix
  ];

  services.flatpak.enable = true;

  environment.systemPackages = stablePackages ++ unstablePackages;
}
