{ config, pkgs, pkgs-unstable, ... }:
{

# List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    vesktop
    discord-ptb

    atlauncher
    prismlauncher

    xclicker
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
