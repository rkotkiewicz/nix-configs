# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelModules = [ "bcm2835-v4l2" ];

  hardware.enableRedistributableFirmware = true;

  networking.hostName = "malina";

  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "nixos" ];
  };

  environment.systemPackages = with pkgs; [
    git
    age
    pam_ssh_agent_auth
    usbutils
  ];

  services.openssh = {
    enable = true;

    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  security.pam = {
    rssh = {
      enable = true;
      settings.auth_key_file = "/etc/ssh/authorized_keys.d/nixos";
    };

    services.sudo.rssh = true;
  };

  networking.firewall.allowedTCPPorts = [ 8080 8123 8081 1883 3001 ];
  networking.firewall.allowedUDPPorts = [ 8080 ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIJSTiqfCvDnjUbPlFcp0+JAx6EBP3z5ERb6DTjAFJcFnAAAABHNzaDo= radek@pc"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBOXmInDpsNfNHyDqYFghEeiui4dcTxHEdRDfCh3ZUFW backup-key-2026-02-12"
    ];
  };

  swapDevices = [{ device = "/swapfile"; size = 1024; }];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
