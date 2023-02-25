{ pkgs, ... }: 

{
  users.users.radek = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      git
      chromium
      ark
      neovim
      smplayer
      mplayer
      yakuake
      zoom-us
      libreoffice-still
      lutris
      kate
      lutris
      neofetch
      ncdu
      jetbrains.idea-community
    ];
  };

  programs.kdeconnect.enable = true;
#  programs.firefox.enablePlasmaBrowserIntegration = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.opengl.driSupport32Bit = true;
}
