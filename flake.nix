{
  description = "The PiSystem flake ^_^";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable } @ inputs :
    let

      system = "x86_64-linux";

      pkgs-stable = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

    in {

      nixosConfigurations = {
        pluto = lib.nixosSystem {

          system = system;

          modules = [ ./systems/pluto.nix ];

          specialArgs = {
            inherit system;
            inherit pkgs-unstable;
          };
        };
      };
    };
}
