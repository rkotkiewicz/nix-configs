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


  services.zigbee2mqtt = {
    enable = true;

    settings = {
      mqtt = {
        base_topic = "zigbee2mqtt";
        server = "mqtt://localhost:1883";
        user = "mosquitto_listener";
      };
      frontend = {
        port = 8080;
      };
      serial = {
        port = "tcp://slzb-mr5u.lan:6638";
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
    serviceConfig = {
        EnvironmentFile = [ config.sops.secrets.mosquitto_pass_env.path ];
    };
  };

  services.mosquitto = {
    enable = true;
    listeners = [{
      port = 1883;
      address = "0.0.0.0";
      users.mosquitto_listener = {
        acl = [ "readwrite #" ];
        hashedPasswordFile = config.sops.secrets.mosquitto_shadow.path;
      };
      settings.allow_anonymous = false;
    }];
  };

  services.matter-server.enable = true;
}
