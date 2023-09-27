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
      rule = {
        matches = {
          {
            { "node.name", "matches", "alsa_output.*" },
          },
        },
        apply_properties = {
          ["session.suspend-timeout-seconds"] = 0,
        },
      }
      table.insert(alsa_monitor.rules, rule)
    '';
  };

}