{ config, pkgs, ... }: {

  fileSystems = {
    "/".options = [ "compress=zstd" "discard=async" ];
#    "/mnt/raw-nixos".options = [ "compress=zstd" "discard=async" ];
#    "/mnt/raw-backup".options = [ "compress=zstd" "discard=async" ];
    "/home" = {
        options = [ "compress=zstd" "discard=async" ];
        dependsOn = [ "/" ];
    };
#    "/home/radek/Games".options = [ "compress=zstd" "discard=async" ];
    "/nix" = {
        options = [ "compress=zstd" "discard=async" ];
        dependsOn = [ "/" ];
    };
    "/mnt/magazyn" = {
        options = [ "compress=zstd" "discard=async" ];
        dependsOn = [ "/" ];
    };
#    "/swap".options = [ "noatime" ];
  };
#  swapDevices = [ { device = "/swap/swapfile"; } ];
}
