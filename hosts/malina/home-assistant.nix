{ inputs, lib, config, pkgs, ... }:

{
  sops = {
    secrets.mosquitto_shadow = {
      owner = "mosquitto";
    };
    secrets.mosquitto_pass_env = {
      owner = "mosquitto";
    };
  };

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
      "home_connect"
      "shelly"
    ];
    config = {
      default_config = {};
      automation = "!include automations.yaml";
    };
  };
}
