{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware = {
      url = "github:nixos/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "git+https://gitlab.com/rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {self, nixpkgs, home-manager, hardware, sops-nix, deploy-rs, firefox-addons, plasma-manager, nixpkgs-stable, ... }@inputs: {

    nixosConfigurations = {
      pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };

        system = "x86_64-linux";

        modules = [ ./hosts/pc ];
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
