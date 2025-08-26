{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./python.nix
  ];

  environment.systemPackages = with pkgs; [
    elan
    scala_3
    graphviz

    gcc
    rustup
    llvmPackages.bintools
  ];
}
