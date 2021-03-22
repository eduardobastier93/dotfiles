#!/usr/bin/env bash

# My favorites packages https://atom.io/packages/
# Check the package name in the GitHub repository, in the file `package.json` for install

packages='
  atom-beautify
  atom-material-syntax
  color-picker
  file-icons
  flatten-json
  ftp-remote-edit
  highlight-selected
  indent-sort
  language-i3wm
  language-swaywm
  mamutal91-shellscript-snippets-atom
  markdown-writer
  pigments
  save-workspace
  '
apm install $packages

#  language-swaywm
