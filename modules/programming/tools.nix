{ 
  config, 
  pkgs, 
  pkgs-unstable, 
  ... 
}:
{
  environment.systemPackages = with pkgs-unstable; [ 
    ghostty 

    jetbrains.rust-rover

    vscode
  ];
}
