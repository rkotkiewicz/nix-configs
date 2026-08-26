{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        (ublock-origin.override {
          installation_mode = "normal_allowed_in_private_browsing";
        })
        bitwarden
        return-youtube-dislikes
        unpaywall
        plasma-integration
      ];

      settings = {
        "dom.ipc.processCount" = 64;
        "dom.ipc.processCount.webIsolated" = 32;
        "browser.tabs.unloadOnLowMemory" = true;

        "signon.rememberSignons" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;

        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.mime-handler" = 1;
      };
    };
  };

  xdg.desktopEntries.firefox = {
    name = "Firefox (Wayland Debug)";
    exec = "env WAYLAND_DEBUG=1 firefox %u";
    terminal = false;
    categories = [ "Network" "WebBrowser" ];
  };
}
