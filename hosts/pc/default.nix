{ inputs, ... }:
let
    hardwareModules = inputs.hardware.nixosModules;
    sopsModules = inputs.sops-nix.nixosModules;
    homeManagerModules = inputs.home-manager.nixosModules;
in
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./user.nix
    ./file-systems.nix
#      ./btrbk.nix
    ./sound.nix
    ./shell.nix
    ./display-server.nix
    ./sshd.nix
    ./solokey2.nix
#      ./ups.nix


    ../../common/locale.nix
    ../../common/sops.nix


    hardwareModules.common-pc
    hardwareModules.common-pc-ssd
    hardwareModules.common-cpu-amd
    hardwareModules.common-cpu-amd-pstate
    hardwareModules.common-gpu-amd

    sopsModules.sops

    homeManagerModules.home-manager {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.radek = {
          imports = [ ./home-manager/home.nix ];
        };
      };
    }
  ];
}