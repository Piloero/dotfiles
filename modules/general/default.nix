{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./programming_languages/default.nix
    ./tools.nix
    ./docker.nix
    ./fonts.nix
    ./vim.nix
    ./shell.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
}
