{ inputs, lib, config, pkgs, ... }: {

  services.xserver.enable = true;
  services.displayManager.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.autoNumlock = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.xserver.xkb.layout = "pl";

#  services.xserver.displayManager.setupCommands = ''
#    CENTER='DP-0'
#    RIGHT='HDMI-0'
#    ${pkgs.xorg.xrandr}/bin/xrandr --output $CENTER --primary --output $RIGHT --rotate right --right-of $CENTER
#  '';

}
