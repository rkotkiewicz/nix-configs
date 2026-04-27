{ ... }:

{
  sops.secrets.homeassistant = {
    path = "/var/lib/hass/secrets.yaml";
    owner = "hass";
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

      homeassistant = {
        name = "Dom";
        latitude = "!secret latitude";
        longitude = "!secret longitude";
        elevation = "!secret elevation";
        unit_system = "metric";
        time_zone = "Europe/Warsaw";
      };
    };
  };
}
