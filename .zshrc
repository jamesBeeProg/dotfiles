#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/jamesclark/.oh-my-zsh"

eval "$(starship init zsh)"

plugins=(sudo extract zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
