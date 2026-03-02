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

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        system = "x86_64-linux";

        modules = [ ./hosts/desktop ];
      };

      malina = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        system = "aarch64-linux";

        modules = [ ./hosts/malina ];
      };
    };
  };
}
