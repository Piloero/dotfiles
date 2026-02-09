
{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  unstablePackages = with pkgs-unstable; [
  ];

  stablePackages = with pkgs; [
    git
  ];
in
{
  # imports = [ ];
  environment.systemPackages = stablePackages ++ unstablePackages;
}
