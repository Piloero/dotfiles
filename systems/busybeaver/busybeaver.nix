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
    ../../modules/desktop/x11-desktop-env.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  nix.settings.ssl-cert-file = "/etc/ssl/certs/ca-bundle.crt";

  environment.sessionVariables = {
    REQUESTS_CA_BUNDLE = "/etc/ssl/certs/ca-bundle.crt";
  };

  security.pki.certificates = [
    (builtins.readFile /home/nixos/.secrets/RootCA.crt)
  ];

  environment.systemPackages = with pkgs; [
    obsidian
  ];

  networking.networkmanager.enable = false;

  system.stateVersion = "24.11";
}
