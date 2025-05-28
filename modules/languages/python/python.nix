    
{ config, pkgs, pkgs-unstable, ... }:

{
  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages (ps: with ps; [ sympy ipykernel numpy sympy icecream]))
  ];
}