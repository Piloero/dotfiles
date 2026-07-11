{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  stablePackages = with pkgs; [
    # FilenIO
    filen-desktop
    filen-cli
  ];

  unstablePackages = with pkgs-unstable; [
    # MEGA
    megasync
    megacmd
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;
}
