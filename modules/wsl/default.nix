{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
let
  unstablePackages = with pkgs-unstable; [ ];
  stablePackages = with pkgs; [ ];
in
{
  # imports = [ ];

  wsl = {
    enable = true;
    docker-desktop.enable = lib.mkDefault true;
  };

  environment.systemPackages = stablePackages ++ unstablePackages;
}
