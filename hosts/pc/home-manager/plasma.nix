{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      iconTheme = "breeze-dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images_dark/3440x1440.png";
    };
    kwin = {
      effects = {
        wobblyWindows.enable = true;
      };
      nightLight = {
        enable = true;
      };
      virtualDesktops = {
        number = 1;
        rows = 1;
      };
    };
    configFile = {
      baloofilerc = {
        "Basic Settings".Indexing-Enabled = false;
      };

      kwalletrc.Wallet = {
        Enabled = false;
        "First Use" = false;
      };

      yakuakerc = {
        Appearance = {
          Skin = "yakuake-breeze_perfect_dark-2.0";
          SkinInstalledWithKns = true;
        };
        Dialogs.FirstRun = false;
        Window.Height = 53;
      };

      krunnerrc.Plugins.baloosearchEnabled = false;
    };
  };
}