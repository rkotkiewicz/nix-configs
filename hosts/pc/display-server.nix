{ inputs, lib, config, pkgs, ... }: {

  services.xserver.enable = true;
  services.displayManager = {
    enable = true;
    sddm = {
      autoNumlock = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    defaultSession = "plasma";
  };

  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb.layout = "pl";

#  services.xserver.displayManager.setupCommands = ''
#    CENTER='DP-0'
#    RIGHT='HDMI-0'
#    ${pkgs.xorg.xrandr}/bin/xrandr --output $CENTER --primary --output $RIGHT --rotate right --right-of $CENTER
#  '';

}
