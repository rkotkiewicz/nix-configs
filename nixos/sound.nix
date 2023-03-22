{ inputs, lib, config, pkgs, ... }: {

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = false;
    media-session = {
      enable = true;
      config.alsa-monitor.rules = [{
        # Matches all cards
        matches = [ { "node.name" = "~alsa_output.*"; } ];
        actions = {
          "update-props" = {
            "audio.position" = "FR,FL";
          };
        };
      }];
    };
  };
}