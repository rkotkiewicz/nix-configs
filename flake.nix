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

    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = {self, nixpkgs, home-manager, hardware, sops-nix, deploy-rs, ... }@inputs: {

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

    deploy.nodes.malina = {
      hostname = "malina";
      profiles.system = {
        sshUser = "nixos";
        user = "root";
        sshOpts = [ "-A" ];
        path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.malina;
      };
    };

    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
