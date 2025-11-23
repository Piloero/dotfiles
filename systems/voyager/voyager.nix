# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
    inputs.nixos-wsl.nixosModules.wsl
    # general stuff
    ../../modules/general/default.nix
  ];

  wsl.enable = true;

  wsl.defaultUser = "piloero";

  # wsl.path.extra = [ "/run/current-system/sw/bin" ];

  wsl.docker-desktop.enable = true;

  virtualisation.docker.enable = false;

  environment.pathsToLink = [ "/bin" ];

  # environment.sessionVariables = {
  #   PATH = [
  #     "/run/current-system/sw/bin"
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    coreutils
    docker
    gnumake
  ];

  # Enable wsl-vpnkit to fix VPN issues
  systemd.services.wsl-vpnkit = {
    enable = true;
    description = "wsl-vpnkit";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.wsl-vpnkit}/bin/wsl-vpnkit";
      Restart = "always";
      KillMode = "mixed";
    };
  };

  programs.nix-ld.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
