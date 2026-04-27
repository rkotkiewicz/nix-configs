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
    ../../common/sops.nix

    hardwareModules.raspberry-pi-3
    sopsModules.sops

    ./home-assistant.nix
    ./uptime-kuma.nix
    ./zigbee2mqtt.nix
    ./matter.nix
    ./mosquitto.nix

    ./avahi.nix
    ./gc.nix];
}

