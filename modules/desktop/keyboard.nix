{ 
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:
{

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules # the only relevant
    qmk_hid
    via
    vial

    # keyboard remapper
    kanata
  ];

  services.udev = {
    packages = with pkgs; [
      qmk
      qmk-udev-rules # the only relevant
      qmk_hid
      via
      vial
    ];
  }; 
}

