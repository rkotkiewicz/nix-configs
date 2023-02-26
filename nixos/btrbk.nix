{ config, pkgs, ... }: {

  services.btrbk = {
    instances."btrbk" = {
      onCalendar = "*:0/30";
      settings = {
        snapshot_preserve_min = "2d";
        snapshot_dir = "btrbk_snapshots";
        volume."/mnt/raw-nixos" = {
          subvolume = {
             "/etc/nixos" = {};
             "@home" = {};
          };
          target = "/mnt/raw-backup/backup";
        };
      };
    };
  };
}
