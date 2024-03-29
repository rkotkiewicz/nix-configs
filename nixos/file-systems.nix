{ config, pkgs, ... }: {

  fileSystems = {
    "/".options = [ "compress=zstd" "discard=async" ];
#    "/mnt/raw-nixos".options = [ "compress=zstd" "discard=async" ];
#    "/mnt/raw-backup".options = [ "compress=zstd" "discard=async" ];
    "/home" = {
        options = [ "compress=zstd" "discard=async" ];
        depends = [ "/" ];
    };
#    "/home/radek/Games".options = [ "compress=zstd" "discard=async" ];
    "/nix" = {
        options = [ "compress=zstd" "discard=async" ];
        depends = [ "/" ];
    };
    "/mnt/magazyn" = {
        options = [ "compress=zstd" "discard=async" ];
        depends = [ "/" ];
    };
#    "/swap".options = [ "noatime" ];
  };
#  swapDevices = [ { device = "/swap/swapfile"; } ];
}
