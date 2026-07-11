{
  description = "The PiSystem flake ^_^";

  inputs = {
    # Pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # WSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # NUR 
    nur.url = "github:nix-community/NUR";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
      nur,
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-stable = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [ nur.overlays.default ];
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [ nur.overlays.default ];
      };

      mkSystem = name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ 
            ./systems/${name}/${name}.nix
            
            { nixpkgs.pkgs = pkgs-stable; }
          ];
          
          specialArgs = {
            inherit system pkgs-unstable inputs;
          };
        };
    in
    {
      nixosConfigurations = {
        pluto      = mkSystem "pluto";
        uranus     = mkSystem "uranus";
        saturn     = mkSystem "saturn";
        busybeaver = mkSystem "busybeaver";
        voyager    = mkSystem "voyager";
      };
    };
}