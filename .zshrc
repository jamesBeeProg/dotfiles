#!/bin/zsh

export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"

plugins=(
	sudo
	extract
)

source $ZSH/oh-my-zsh.sh

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
