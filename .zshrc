# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jaakko/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

<<<<<<< HEAD
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# End of lines added by compinstall

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
=======
# End of lines added by compinstall

>>>>>>> e642f17d20378d07a018f8aefe591270e48bda3b

unset zle_bracketed_paste


WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


PROMPT_EOL_MARK=''


# Prompt
export PS1="%F{39}%n %F{white}%~ %F{39}$ %F{white}"


# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
<<<<<<< HEAD
alias git-lines='git ls-files | xargs wc -l'
cdl() { cd $1 && ls }
=======


# ENV
export VISUAL=vim
export EDITOR=vim
>>>>>>> e642f17d20378d07a018f8aefe591270e48bda3b


# vi mode
bindkey -v
export KEYTIMEOUT=1


# -----------------------------------
# Keybindings
# -----------------------------------
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Backspace]="${terminfo[kbs]}"

[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char

bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^H"      backward-delete-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
<<<<<<< HEAD

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
=======
>>>>>>> e642f17d20378d07a018f8aefe591270e48bda3b
