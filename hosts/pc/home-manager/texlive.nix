{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    kile
    (texlive.withPackages (ps: with ps; [
      scheme-medium
      latexmk
      fontawesome6
      multirow
      dvipng
    ]))
  ];
}