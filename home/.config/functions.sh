#!/usr/bin/env bash

source $HOME/.colors &>/dev/null

function f() {
  git fetch https://github.com/${1} ${2}
}

function p() {
  git cherry-pick ${1}
}

function translate() {
  typing=$(mktemp)
  rm -rf $typing && nano $typing
  msg=$(trans -b :en -no-auto -i $typing)
  cat $typing
}

function cm() {
  translate
  git add . && git commit --message $msg --signoff --author "Eduardo Bastier <eduardobastier93@gmail.com>"
}

function c() {
  git add . && git commit --author "${1}"
}

function amend() {
  git add . && git commit --amend
}

function update() {
  $HOME/.config/scripts/pacman-update.sh
}

function sshconfig() {
  echo "${GRE}Creating key for ${BLU}Equinix${END}"
  ssh-keygen -t rsa
  echo "${RED}Type pass ${BLU}Equinix ${RED}server:${END}"
  ssh-copy-id mamutal91@147.75.63.219
  echo "${GRE}Creating key for ${BLU}GitHub${END}"

  ssh-keygen -t ed25519 -C "mamutal91@github.com"
  eval "$(ssh-agent -s)" && ssh-add -l
  cat $HOME/.ssh/id_ed25519.pub | wl-copy
  xdg-open https://github.com/settings/ssh/new
}
