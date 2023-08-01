#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.tmarcinek.activationPackage
./result/activate
popd
