{
  description = "The PiSystem flake ^_^";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-wsl } @ inputs :
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
            inherit system pkgs-unstable;
          };
        };

        busybeaver = nixpkgs-unstable.lib.nixosSystem {

          system = system;

          modules = [
            ./systems/busybeaver.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable inputs;
          };
        };
      };
    };
}
