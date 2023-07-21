# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

let
  linux-firmware = pkgs.linux-firmware.overrideAttrs (prev: {
    version = "20230404-git";

    src = pkgs.fetchzip {
        url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20230404.tar.gz";
        hash = "sha256-HZ2uU8BQKTkDup19mzhf67u48aFVyQfGQSVlCqFPWsk=";
    };
    outputHash = "sha256-CHD/MRut/0yjPuG+hH2gsbTR/Dhk4DbWfHsCbsg1oX8=";
});
in
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

    kernelModules = [ "nct6775" "snd_hda_intel" "snd_hda_codec_ca0132" ];

    kernelParams = [
      "video=DP-1:3440x1440@144"
      "video=HDMI-A-1:1920x1200@60,rotate=180"
      "modules_nct6775_args=force_id=0xd420"
    ];
  };
  networking.hostName = "nix-pc"; # Define your hostname.


  services.fwupd.enable = true;


  hardware.opengl.enable = true;


  hardware.firmware = [ pkgs.alsa-firmware linux-firmware ];
  hardware.cpu.amd.updateMicrocode = true;

  services.unclutter.enable = true;
  virtualisation.docker.enable = true;
  # Enable CUPS to print documents.
  # services.printing.enable = true;


  security.rtkit.enable = true;

  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
  programs.corectrl.gpuOverclock.enable = true;

  programs.partition-manager.enable = true;
  programs.adb.enable = true;

  programs.htop.enable = true;

  services.acpid.enable = true;

  hardware.bluetooth.enable = true;
 
  environment.systemPackages = with pkgs; [
    compsize
    vdpauinfo
    pciutils
    glxinfo
    mtr
    lm_sensors
    ffmpeg_5
    vulkan-tools
    libva-utils
    inxi];



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

