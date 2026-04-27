{ ... }:

{

  sops.secrets.mosquitto_pass_env = {
    owner = "zigbee2mqtt";
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
}