{ config, pkgs, theme, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.default = {
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
}
