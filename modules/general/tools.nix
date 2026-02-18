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
    nixfmt

    bind # nslookup

    # Linux Control tools
    smartmontools

    git # TODO move to own file with config
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
