{
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:

{
  imports = [
    ./vim.nix
    ./fonts.nix
    ./cli-tools.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      download-buffer-size = 500000000; # 500 MB
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
