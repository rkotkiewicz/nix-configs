# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./firefox.nix
    ./texlive.nix
  ];


  home = {
    username = "radek";
    homeDirectory = "/home/radek";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
   home.packages = with pkgs; [
     gradle
     vial
     chromium
     ark
     neovim
     smplayer
     mplayer
     yakuake
     zoom-us
     libreoffice-qt
     lutris
     kate
     lutris
     neofetch
     ncdu
     jetbrains.idea-community
     krusader
     powerdevil
     wget
     libva-utils
     upscayl
   ];

  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
