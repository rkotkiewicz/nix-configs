{ inputs, lib, config, pkgs, ... }:

{

  virtualisation.oci-containers = {
    backend = "docker";
    containers.otbr = {
      image = "openthread/border-router:latest";

      autoStart = true;

      environment = {
        OT_RCP_DEVICE = "spinel+hdlc+uart:///dev/ttyACM1?uart-baudrate=460800";
        OT_INFRA_IF = "eth0";
        OT_THREAD_IF = "wpan0";
        OT_LOG_LEVEL = "7";

        OTBR_WEB_PORT = "8081";
      };

      extraOptions = [
        "--network=host"
        "--cap-add=NET_ADMIN"
        "--privileged"
        "--device=/dev/ttyACM1"
        "--device=/dev/net/tun"
        "--volume=/var/lib/otbr:/data"
      ];
    };
  };

#  boot.kernel.sysctl = {
#    "net.ipv6.conf.all.forwarding" = 1;
#    "net.ipv6.conf.default.forwarding" = 1;
#  };

  services.avahi = {
    enable = true;
    ipv4 = true;
    ipv6 = true;
    nssmdns4 = true;
    nssmdns6 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  networking.enableIPv6 = true;
  boot.kernel.sysctl = {
    "net.ipv6.conf.all.forwarding" = 1;
  };

  networking.firewall.enable = false;

#  services.otbr = {
#    enable = true;
#    interface = "wpan0"; # The interface for your Thread radio (e.g., USB stick)
#    radioUrl = "spinel+uart:////dev/serial/by-id/usb-SMLIGHT_SMLIGHT_SLZB-MR5U_SLZB-MR5U234054-if01";
#  };
}