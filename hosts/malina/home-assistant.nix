{ config, pkgs, ... }:
{
  users.users.homeassistant = {
    isNormalUser = true;
    home = "/var/lib/homeassistant";
    createHome = true;
    group = "homeassistant";
    uid = 1001;
    linger = true;
    autoSubUidGidRange = true;
    shell = "/run/current-system/sw/bin/nologin";
    hashedPassword = "!";
  };
  users.groups.homeassistant.gid = 1001;

  sops.secrets.homeassistant = {
    path = "/var/lib/homeassistant/config/secrets.yaml";
    owner = "homeassistant";
    group = "homeassistant";
    mode = "0400";
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      image = "ghcr.io/home-assistant/home-assistant:2026.8.2";
      podman.user = "homeassistant";

      extraOptions = [
        "--network=host"
        "--memory=750m"
        "--memory-swap=1g"
        "--cap-add=NET_ADMIN"
        "--cap-add=NET_RAW"
      ];

      volumes = [
        "/var/lib/homeassistant/config:/config"
        "/etc/localtime:/etc/localtime:ro"
      ];

      environment = {
        TZ = "Europe/Warsaw";
      };
    };
  };

  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

}
