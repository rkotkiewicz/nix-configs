{ inputs, lib, config, pkgs, ... }: {

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.autoNumlock = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.displayManager.defaultSession = "plasmawayland";
  services.xserver.xkb.layout = "pl";

  services.xserver.videoDrivers = lib.mkDefault [ "amdgpu" ];
#  services.xserver.displayManager.setupCommands = ''
#    CENTER='DP-0'
#    RIGHT='HDMI-0'
#    ${pkgs.xorg.xrandr}/bin/xrandr --output $CENTER --primary --output $RIGHT --rotate right --right-of $CENTER
#  '';

}
