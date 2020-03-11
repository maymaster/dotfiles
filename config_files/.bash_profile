# Author
# 	Sergio Quijano Rey
# 	sergiquijano@gmail.com
# Description:
# 	Customized .bash_profile 
# Version
# 	v1.0 23/10/2018 - First functionally version

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
export TERMCMD="termite"
export COLORTERM="termite"

# SSH vars
export LOCALIP="192.168.1.101"
export REMOTEIP="sergioquijano.duckdns.org"
export RASPIP="danielsergio.duckdns.org"

# I3WM vars
export ROFI_THEME=".i3/rofithemes/sidetab.rasi"
export BROWSER="firefox"
