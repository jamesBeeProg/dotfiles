#!/bin/zsh

export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"

plugins=(
	sudo
	extract
)

source $ZSH/oh-my-zsh.sh

alias dot="/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME"
