{ config, pkgs, theme, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.default.settings = {
      "dom.ipc.processCount" = 64;
      "dom.ipc.processCount.webIsolated" = 32;
      "browser.tabs.unloadOnLowMemory" = true;
    };
  };
}
