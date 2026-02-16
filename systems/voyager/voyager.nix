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
    inputs.nixos-wsl.nixosModules.wsl
    # WSL Nix config
    ../../modules/wsl/default.nix
    # general stuff
    ../../modules/general/default.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "piloero";
    docker-desktop.enable = true;
  };

  virtualisation.docker.enable = false;

  environment.pathsToLink = [ "/bin" ];

  environment.systemPackages = with pkgs; [
    # coreutils
    # gnumake
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

  networking.networkmanager.enable = false;

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
