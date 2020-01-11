#
# ~/.bashrc
#

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput setaf 39)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 7)\]\W\[$(tput setaf 39)\] \\$ \[$(tput sgr0)\]"
# then export PS1="\[$(tput setaf 208)\][\[$(tput setaf 39)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 7)\]\W\[$(tput setaf 208)\]]\[$(tput setaf 39)\]\\$ \[$(tput sgr0)\]"

	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias crep="grep --color=always" # Color grep - highlight desired sequence.

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/home/jaakko/.local/bin
