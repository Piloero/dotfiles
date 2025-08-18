{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./filen.nix
    ./hyprland.nix
    ./keyboard.nix
    ./kanata.nix
    ./desktop-env.nix
  ];

  services.flatpak.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    duckdb
    gimp

    jetbrains.idea-ultimate
    jetbrains.clion

    brave

    obsidian
    pkgs-unstable.signal-desktop

    elan
    scala_3
    graphviz

    gcc
    rustup
    llvmPackages.bintools

    (pkgs.python3.withPackages (
      ps: with ps; [
        sympy
        ipykernel
        numpy
        sympy
        icecream
      ]
    ))

    megasync

    keepassxc
    rclone

    usbimager

    libwacom
    xf86_input_wacom

    # kdePackages.okular
    scribus
    xournalpp
    naps2

    copyq

    audacity
  ];
}
