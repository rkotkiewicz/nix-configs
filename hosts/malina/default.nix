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

    ../../common/locale.nix

    hardwareModules.raspberry-pi-3
    sopsModules.sops

    ./home-assistant.nix
    ./avahi.nix];
}

