{ inputs, lib, config, pkgs, ... }: {

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.etc."wireplumber/main.lua.d/90-suspend-timeout.lua" = {
    text = ''
      session.suspend-timeout-seconds = 0
    '';
  };

}