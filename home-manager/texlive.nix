{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-full
      moderncv
      fontawesome5
      academicons
      marvosym
      arydshln
      fontspec
      multirow;
  });
in
{
  home.packages = with pkgs; [
    tex
    kile
  ];
}
