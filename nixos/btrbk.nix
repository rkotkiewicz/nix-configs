{ config, pkgs, ... }: {

# to reduce the size of btrbk snapshots, create btrfs subvolumes, e.g.
# @home/<user>/.local/share/Steam
# @home/<user>/.cache
# @home/<user>/.local/share/baloo

  services.btrbk = {
    instances."btrbk" = {
      onCalendar = "*:0/30";
      settings = {
        snapshot_preserve_min = "2d";
        snapshot_dir = "btrbk_snapshots";
        volume."/mnt/raw-nixos" = {
          subvolume = {
             "@home" = {};
          };
          target = "/mnt/raw-backup/backup";
        };
      };
    };
  };
}
