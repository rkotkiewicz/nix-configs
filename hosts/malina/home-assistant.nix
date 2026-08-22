{ pkgs, ... }:

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
      "plant"
    ];

    package = pkgs.home-assistant.override {
      extraPackages = pyPkgs: with pyPkgs; [
        pysmlight
        bleak-smlight
        python-otbr-api
      ];
    };

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

      plant = {
        crassula_ovata = {
          sensors = {
            moisture = "sensor.crassula_ovata_soil_moisture";
            temperature = "sensor.crassula_ovata_temperature";
          };

          # Grubosz / jade plant
          min_moisture = 10;
          max_moisture = 30;

          min_temperature = 10;
          max_temperature = 32;
        };

        epipremnum_amplissimum = {
          sensors = {
            moisture = "sensor.epipremnum_amplissimum_soil_moisture";
            temperature = "sensor.epipremnum_amplissimum_temperature";
          };

          min_moisture = 25;
          max_moisture = 55;

          min_temperature = 16;
          max_temperature = 32;
        };

        platycerium_bifurcatum = {
          sensors = {
            moisture = "sensor.platycerium_bifurcatum_soil_moisture";
            temperature = "sensor.platycerium_bifurcatum_temperature";
          };

          # Łosie rogi lubią wyższą wilgotność
          min_moisture = 35;
          max_moisture = 70;

          min_temperature = 16;
          max_temperature = 30;
        };

        dracaena_trifasciata = {
          sensors = {
            moisture = "sensor.0xa4c1388f86e72e8f_soil_moisture";
            temperature = "sensor.0xa4c1388f86e72e8f_temperature";
            brightness = "sensor.0xa4c1388f86e72e8f_illuminance";
            conductivity = "sensor.0xa4c1388f86e72e8f_soil_fertility";
          };

          # Sansewieria
          min_moisture = 10;
          max_moisture = 30;

          min_temperature = 10;
          max_temperature = 32;

          # luksów; raczej orientacyjne
          min_brightness = 500;
          max_brightness = 30000;

          # µS/cm
          min_conductivity = 200;
          max_conductivity = 2000;
        };
      };
    };
  };
}
