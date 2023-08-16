#!/bin/bash

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) machine=Linux;;
    Darwin*) machine=Mac;;
    *) machine="UNKNOWN:${unameOut}"
esac
echo ${machine}
