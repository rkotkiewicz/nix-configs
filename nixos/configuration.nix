# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./user.nix
      ./file-systems.nix
#      ./btrbk.nix
      ./locale.nix
      ./sound.nix
      ./shell.nix
      ./display-server.nix
      ./sshd.nix
#      ./ups.nix
    ];

    nixpkgs = {
      # You can add overlays here
      overlays = [
        # If you want to use overlays exported from other flakes:
        # neovim-nightly-overlay.overlays.default

        # Or define it inline, for example:
        # (final: prev: {
        #   hi = final.hello.overrideAttrs (oldAttrs: {
        #     patches = [ ./change-hello-to-hi.patch ];
        #   });
        # })
      ];
      config = {
        allowUnfree = true;
      };
    };

  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];

    kernelModules = [ "andgpu" "nct6775" "snd_hda_intel" "snd_hda_codec_ca0132" ];

    initrd.kernelModules = ["amdgpu"];

    kernelParams = [
      "video=card0-DP-2:3440x1440@144"
      "video=card0-HDMI-A-2:1920x1200@60,rotate=180"
      "modules_nct6775_args=force_id=0xd420"
      "mem_sleep_default=s2idle"
    ];


    extraModprobeConfig = ''
      options snd_hda_intel power_save=0 power_save_controller=0
      options nct6775 force_id=0xd420
    '';
  };
  networking.hostName = "nix-pc"; # Define your hostname.


  services.fwupd.enable = true;


  hardware.firmware = [ pkgs.alsa-firmware ];
  hardware.cpu.amd.updateMicrocode = true;

  services.unclutter.enable = true;
  virtualisation.docker.enable = true;
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };



  security.rtkit.enable = true;

  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
  programs.corectrl.gpuOverclock.enable = true;

  programs.partition-manager.enable = true;
  programs.adb.enable = true;

  programs.htop.enable = true;

  services.acpid.enable = true;

  hardware.bluetooth.enable = true;

  programs.gamescope.enable = true;
 
  environment.systemPackages = with pkgs; [
    compsize
    vdpauinfo
    pciutils
    glxinfo
    mtr
    lm_sensors
    ffmpeg_7
    vulkan-tools
    libva-utils
    inxi
    exfat
    xxd
    usbutils];


  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

