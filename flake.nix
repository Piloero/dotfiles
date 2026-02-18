{
  description = "The PiSystem flake ^_^";

  inputs = {
    # Pkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # WSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
    }@inputs:
    let

      system = "x86_64-linux";

      pkgs-stable = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;

    in
    {
      # TODO make function
      # makeNixOsSystem = name :

      nixosConfigurations = {
        pluto = lib.nixosSystem {

          system = system;

          modules = [
            ./systems/pluto/pluto.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable;
          };
        };

        uranus = lib.nixosSystem {

          system = system;

          modules = [
            ./systems/uranus/uranus.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable;
          };
        };

        saturn = lib.nixosSystem {

          system = system;

          modules = [
            ./systems/saturn/saturn.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable;
          };
        };

        busybeaver = nixpkgs-unstable.lib.nixosSystem {

          system = system;

          modules = [
            ./systems/busybeaver/busybeaver.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable inputs;
          };
        };

        voyager = nixpkgs-unstable.lib.nixosSystem {

          system = system;

          modules = [
            ./systems/voyager/voyager.nix
          ];

          specialArgs = {
            inherit system pkgs-unstable inputs;
          };
        };
      };
    };
}
