{ 
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:

{
  environment.systemPackages = with pkgs; [
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
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    flags = [
      "--cmd cd"
    ];
  };
}

