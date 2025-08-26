{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # Install firefox.
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    brave
  ];
}
