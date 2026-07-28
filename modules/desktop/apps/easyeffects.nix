{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # configuration.nix
  environment.systemPackages = [ pkgs.easyeffects ];

  # Autostart EasyEffects service on login
  systemd.user.services.easyeffects = {
    description = "EasyEffects Daemon";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
      Restart = "on-failure";
    };
  };
}

