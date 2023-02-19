{ config, pkgs, theme, ... }:

{
    programs.firefox = {
        enable = true;
        enablePlasmaBrowserIntegration = true;
    };
}
