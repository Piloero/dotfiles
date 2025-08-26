{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  stablePackages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.clion
  ];

  unstablePackages = with pkgs-unstable; [
    jetbrains.rust-rover
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;
}
