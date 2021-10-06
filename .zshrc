# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jaakko/.zshrc'

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# End of lines added by compinstall

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

unset zle_bracketed_paste


WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


PROMPT_EOL_MARK=''


# Prompt
export PS1="%F{39}%n %F{white}%c %F{39}$ %F{white}"


# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias git-lines='git ls-files | xargs wc -l'
cdl() { cd $1 && ls }


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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/jaakko/Lataukset/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jaakko/Lataukset/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/jaakko/Lataukset/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jaakko/Lataukset/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
