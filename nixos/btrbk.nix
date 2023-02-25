{ config, pkgs, ... }:

{
  
  fileSystems = {
    "/".options = [ "compress=zstd" "discard=async" ];
    "/mnt/raw-nixos".options = [ "compress=zstd" "discard=async" ];
    "/mnt/raw-backup".options = [ "compress=zstd" "discard=async" ];
    "/home".options = [ "compress=zstd" "discard=async" ];
    "/home/radek/Games".options = [ "compress=zstd" "discard=async" ];
    "/nix".options = [ "compress=zstd" "noatime" "discard=async" ];
    "/swap".options = [ "noatime" ];
  };
  swapDevices = [ { device = "/swap/swapfile"; } ];


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
