{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, hardware, sops-nix, ... }@inputs: {
    # NixOS configuration entrypoint
    nixosConfigurations = {
      "nix-pc" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        system = "x86_64-linux";

        modules = [
          ./nixos/configuration.nix

          hardware.nixosModules.common-pc
          hardware.nixosModules.common-pc-ssd
          hardware.nixosModules.common-cpu-amd
          hardware.nixosModules.common-cpu-amd-pstate
          hardware.nixosModules.common-gpu-amd

          sops-nix.nixosModules.sops

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.radek = {
                imports = [ ./home-manager/home.nix ];
              };
            };
          }
        ];
      };
    };
  };
}
