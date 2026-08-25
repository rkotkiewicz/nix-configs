{ ... }:

{
    users.users.matter = {
      isSystemUser = true;
      home = "/var/lib/matter-server";
      createHome = true;
      group = "matter";
      linger = true;
      autoSubUidGidRange = true;
      shell = "/run/current-system/sw/bin/nologin";
      hashedPassword = "!";
    };

    users.groups.matter = { };

    virtualisation.oci-containers.containers.matter-server = {
      image = "ghcr.io/matter-js/matterjs-server:1.4.0";
      podman.user = "matter";
      extraOptions = [ "--network=host" ];
      volumes = [ "/var/lib/matter-server/data:/data" ];
    };
}