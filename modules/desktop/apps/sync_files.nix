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
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;
}
