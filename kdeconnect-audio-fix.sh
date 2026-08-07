#!/bin/sh
systemctl --user stop wireplumber
rm -rf ~/.local/state/wireplumber/
systemctl --user start wireplumber