{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ### --------------- ###
    ###       CLI       ###
    ### --------------- ###
    rclone

    stow
    wget

    openconnect

    git # TODO move to own file with config
    zsh

    dmidecode
    netdata

    neofetch

    bat

    btop
    htop

    fd
    eza
    tldr
    duf
    lsd
    ripgrep
    tmux
    zellij
    helix
    yazi

    lsyncd

    fzf

    jq

    # nix
    devenv
    nixfmt-rfc-style
    nixfmt-tree

    ### --------------- ###
    ###       GUI       ###
    ### --------------- ###
    copyq
    postman
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    flags = [
      "--cmd cd"
    ];
  };
}
