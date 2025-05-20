{ config, pkgs, pkgs-unstable, ... }:

{
  # Enable hyprland on NIXOS
  programs.hyprland = {
    enable = true;
    # needed for x applications
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # Opengl
    graphics.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  # desktop portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = [
    pkgs.hyprlock
    pkgs.hyprshot
    pkgs.hypridle

    # notifications
    pkgs.swaynotificationcenter
    pkgs.libnotify

    pkgs.kitty

    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))

    # wallpaper
    pkgs.swww

    # applauncher
    pkgs.rofi-wayland
    pkgs.wofi

    # file manager
    pkgs.kdePackages.dolphin
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.kio-fuse
    pkgs.kdePackages.kio-extras

    # fonts #todo move away
    pkgs.nerdfonts
    pkgs.font-awesome

    pkgs.networkmanagerapplet
    pkgs.brightnessctl
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    # nerd-fonts
    jetbrains-mono
  ];
}
