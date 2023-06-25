{ config, pkgs, theme, ... }:

{
    programs.firefox = {
        enable = true;
        package = pkgs.firefox-wayland;
    };
}
