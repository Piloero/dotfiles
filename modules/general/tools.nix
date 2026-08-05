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
    wireshark
    copyq
    postman

    duckdb

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
    # pkgs-unstable.gitbutler
    # pkgs.nur.repos.Alxandr.gitbutler-cli

    # AI tools
    pkgs-unstable.codex
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
