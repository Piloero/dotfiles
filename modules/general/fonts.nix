{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{

  # Enable nerd fonts and set JetBrains Mono as default
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono

      jetbrains-mono

      # noto-fonts
      # noto-fonts-cjk-sans
      # noto-fonts-emoji
      # liberation_ttf
      # fira-code
      # fira-code-symbols
      # mplus-outline-fonts.githubRelease
      # dina-font
      # proggyfonts
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };
}
