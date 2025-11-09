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

    openconnect

    dmidecode
    netdata

    # btop
    btop-cuda
    htop

    lsyncd

    # nix
    # devenv
    # nixfmt-rfc-style
    # nixfmt-tree

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
