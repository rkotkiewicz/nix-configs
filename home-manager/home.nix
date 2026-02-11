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
     neovim
     smplayer
     mpv
     zoom-us
     libreoffice-qt
     lutris
     neofetch
     ncdu
     jetbrains.idea-oss
     krusader
     wget
     libva-utils
     upscayl
     heroic
     phoronix-test-suite
     protonup-qt
     bottles
     python3
     calibre
     discord-ptb
     burpsuite
     floorp-bin
     kdePackages.ark
     kdePackages.yakuake
     kdePackages.kate
     kdePackages.powerdevil
     tlrc
     p7zip
     deluge
     comma
     easyeffects
     solo2-cli
   ];


  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
