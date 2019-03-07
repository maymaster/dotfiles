# Author
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Description:
# 	Customized .profile 
# Version
# 	v1.0 23/10/2018 - First functionally version

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# My personal paths
#==============================================================================
PATH="$PATH:/home/sergio/bin"
PATH="$PATH:/home/sergio/.i3/scripts"
PATH="$PATH:/home/sergio/.launchers"

# Ruby path for nvim
PATH="$PATH:/home/sergio/.gem/ruby/2.6.0/bin"
PATH="$PATH:/root/.gem/ruby/2.6.0/bin"

# Enviroment vars
#===============================================================================

# NVIM + URXVT Stack
export EDITOR="nvim"
export VISUAL="nvim"
export TERMCMD="alacritty"
export TERM="alacritty"
export COLORTERM="alacritty"

# SSH vars
export RASPIP="192.168.1.8"
export atc_usr="E2estudiante9"
export atc_addr="$atc_usr@atcgrid.ugr.es"
export atc_pwd="gdpthgbcbp"
