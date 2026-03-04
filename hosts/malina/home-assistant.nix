{ inputs, lib, config, pkgs, ... }:

{
  services.home-assistant = {
    enable = true;
    extraComponents = [
      "met"
      "default_config"
      "mqtt"
      "roborock"
      "yeelight"
      "xiaomi_miio"
      "esphome"
      "matter"
      "thread"
      "otbr"
      "isal"
    ];
    config = {
      default_config = {};
      automation = "!include automations.yaml";
    };
  };


    services.zigbee2mqtt = {
      enable = true;
      settings = {
        mqtt = {
          base_topic = "zigbee2mqtt";
          server = "mqtt://localhost:1883";
        };

        frontend = {
          port = 8080;
        };
        serial = {
          port = "/dev/serial/by-id/usb-SMLIGHT_SMLIGHT_SLZB-MR5U_SLZB-MR5U234054-if00";
          baudrate = 115200;
          adapter = "ember";
        };

      };
    };

      systemd.services.zigbee2mqtt = {
        requires = [
        "mosquitto.service"
        "network-online.target"];


        after = [ "mosquitto.service" "network-online.target" ];
      };

    services.mosquitto = {
      enable = true;
      settings = {
      };
    };

    services.esphome = {
      enable = true;
      address = "0.0.0.0";
      port = 6052;
      openFirewall = true;
    };

    services.matter-server.enable = true;
}
