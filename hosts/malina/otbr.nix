{ inputs, lib, config, pkgs, ... }:

{

  virtualisation.oci-containers = {
    backend = "docker";
    containers.otbr = {
      image = "openthread/border-router:latest";

      autoStart = true;

      environment = {
        OT_RCP_DEVICE = "spinel+hdlc+uart:///dev/ttyACM1?uart-baudrate=460800";
      };

      extraOptions = [
        "--network=host"
        "--cap-add=NET_ADMIN"
        "--device=/dev/ttyACM1"
        "--device=/dev/net/tun"
        "--volume=/var/lib/otbr:/data"
      ];
    };
  };


  services.avahi.enable = true;

  networking.enableIPv6 = true;

  boot.kernel.sysctl."net.ipv6.conf.all.forwarding" = 1;

}