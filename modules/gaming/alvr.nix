{ pkgs, ... }:
{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    android-tools
  ];
}