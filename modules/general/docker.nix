{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # In /etc/nixos/configuration.nix
  virtualisation.docker = {
    enable = lib.mkDefault true;
  };

  environment.systemPackages = with pkgs; [
    docker
  ];
}
