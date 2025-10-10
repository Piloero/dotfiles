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
    jetbrains.rust-rover
  ];

  unstablePackages = with pkgs-unstable; [
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;
}
