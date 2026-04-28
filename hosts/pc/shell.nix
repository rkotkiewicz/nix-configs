{ inputs, lib, config, pkgs, ... }: {

  console = {
    keyMap = "pl";
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
      theme = "afowler";
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

}