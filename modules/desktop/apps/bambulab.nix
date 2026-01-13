{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (bambu-studio.overrideAttrs (previousAttrs: {
      version = "01.00.01.50";
      src = fetchFromGitHub {
        owner = "bambulab";
        repo = "BambuStudio";
        rev = "v01.00.01.50";
        hash = "sha256-7mkrPl2CQSfc1lRjl1ilwxdYcK5iRU//QGKmdCicK30=";
      };
    }))
  ];
}
