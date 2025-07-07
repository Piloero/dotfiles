{ 
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:
{
  # In /etc/nixos/configuration.nix
  virtualisation.docker = {
    enable = true;
  };

}
