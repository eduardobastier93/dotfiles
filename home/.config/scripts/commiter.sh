#!/usr/bin/env bash

repo1="dotfiles"

repos="$repo1"

chosen="$(echo -e "$repos" | wofi --lines 1 --sort-order=DEFAULT --dmenu -p "  Commiter")"
case $chosen in
    $repo1)
        alacritty -t newcommit --working-directory $HOME/.dotfiles;;
esac
exit 0;
