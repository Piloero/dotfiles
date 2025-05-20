{ 
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:

{

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    stow
    wget

    openconnect

    git
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
  ];


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    configure = {
      customRC = ''
        set number relativenumber
        set cc=100
        set list
      '';
    };
  };


}

