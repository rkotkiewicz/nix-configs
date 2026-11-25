{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    opencode
    deploy-rs
  ];

  shellHook = ''
    if [ -f "$HOME/.config/ai-keys/env" ]; then
      source "$HOME/.config/ai-keys/env"
    fi
  '';
}
