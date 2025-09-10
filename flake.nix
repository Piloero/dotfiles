{
  description = "The PiSystem flake ^_^";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixfmt-rfc-style.url = "github:nixos/nixfmt";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
      nixfmt-rfc-style,
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
      # Define the formatter for a specific system (e.g., x86_64-linux)
      formatter.x86_64-linux = nixfmt-rfc-style.packages.x86_64-linux.nixfmt;

      # You can define it for multiple systems if needed
      formatter.aarch64-darwin = nixfmt-rfc-style.packages.aarch64-darwin.nixfmt;

      # TODO make function
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
      };
    };
}
