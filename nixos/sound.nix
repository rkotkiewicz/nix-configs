{ inputs, lib, config, pkgs, ... }: {

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/wireplumber/main.lua.d/90-suspend-timeout.lua" ''
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
         '')
      ];
    };
    jack.enable = true;
  };
}


