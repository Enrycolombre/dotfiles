#  _                _
# | |__  ___ _ ___ | |__  _,___ ___
# |  _ \/  _'| /__\|' _  \| __/  __|
# | |_| | <_| \__ \| | |  | | | <__
# |___/ \_____|___/__| |__|_| \____|

# ~/.bashrc
#
#---------------------------------------#
#		ATTENZIONE		#
# dopo le modifiche dare source .bashrc #
#					#
#---------------------------------------#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon 			# Disabilita Ctrl-s e Ctrl-q
shopt -s autocd			# Fa cd in automatico scrivendo il nome della directory
HISTSIZE=HISTFILESIZE		# La storia infinita

#[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


#alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Un prompt colorato
#export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\]
#\[\e[32m\]:\[\e[m\]\[\e[35m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]
\[\e[32m\]:\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
fortune
