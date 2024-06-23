{ pkgs, ... }: 

{
  users.users.radek = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  programs.kdeconnect.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];


}
