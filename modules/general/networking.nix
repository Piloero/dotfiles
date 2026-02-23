{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  networking.networkmanager.enable = lib.mkDefault true;

  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openconnect
    networkmanager-openvpn
  ];

  environment.systemPackages = with pkgs; [
    openconnect

    # VPN
    networkmanager-openvpn
    openvpn
    openconnect
  ];
}
