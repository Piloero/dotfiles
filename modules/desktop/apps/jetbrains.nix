{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  stablePackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    jetbrains.datagrip
  ];

  unstablePackages = with pkgs-unstable; [
    jetbrains.clion
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;
}
