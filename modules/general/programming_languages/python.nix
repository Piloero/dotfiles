{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (
      ps: with ps; [
        sympy
        ipykernel
        numpy
        sympy
        icecream
      ]
    ))
  ];
}
