# nix-configs
My nixos, home-manager and nix flakes configurations.

nix flake update --commit-lock-file

sudo nixos-rebuild switch --flake .#


https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution

nix-env --list-generations --profile /nix/var/nix/profiles/system

nix-env --delete-generations +5
sudo nix-collect-garbage
nix-collect-garbage