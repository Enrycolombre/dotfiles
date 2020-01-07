#!/bin/sh
# File .profile (viene eseguito al login)


export PATH=$PATH:$HOME/.scripts
export EDITOR="nvim"
export TERMINAL="rxvt-unicode"
export BROWSER="firefox"
#export BROWSER="qutebrowser"
export FILE="vifm"

# Aggiunge la cartella .scripts alla variabile di ambiente PATH
# così gli script sono richiamabili velocemente.
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
[ -f ~/.bashrc ] && source ~/.bashrc

