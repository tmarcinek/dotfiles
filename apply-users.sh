#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/tmarcinek/home.nix
popd
