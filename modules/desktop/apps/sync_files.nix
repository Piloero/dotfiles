{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # FilenIO
    filen-desktop
    filen-cli

    # MEGA
    megasync

  ];
}
