{ config, lib, pkgs, inputs, ... }:
{
  # Enable nerd fonts and set JetBrains Mono as default
  fonts = {
    packages = with pkgs; [
      nerdfonts
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };
}