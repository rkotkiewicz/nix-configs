# nix-configs
My nixos, home-manager and nix flakes configurations.

nix flake update --commit-lock-file

sudo nh os switch .#pc
deploy .#malina


https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution

nix-env --list-generations --profile /nix/var/nix/profiles/system

nix-env --delete-generations +5
sudo nix-collect-garbage -d
nix-collect-garbage