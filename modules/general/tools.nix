{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ### --------------- ###
    ###       GUI       ###
    ### --------------- ###
    copyq
    postman

    ### --------------- ###
    ###       CLI       ###
    ### --------------- ###
    rclone

    wget

    dmidecode
    netdata

    # btop
    btop-cuda
    htop

    lsyncd

    # nix
    nixfmt-rfc-style

    bind # nslookup

    # Linux Control tools
    smartmontools
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
