alias emacs='open -a Emacs.app'
export EDITOR="mate -w"
export PATH="/opt/local/lib/postgresql83/bin:/opt/local/bin:/usr/local/mysql/bin:/usr/local/mongodb/bin:$PATH"
# nginx aliases
alias startnginx='sudo /opt/nginx/sbin/nginx' 
alias stopnginx='sudo kill `cat /opt/nginx/logs/nginx.pid `' 
alias restartnginx='stopnginx; startnginx'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd correctall hist_ignore_all_dups

# Completion settings
autoload -U compinit
compinit  

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# seperate close errors from matches
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'


# shortcuts
alias ls="ls -FG"
alias ll="ls -l"
alias l="ls -l"
alias la="ls -la"
alias l.='ls -d .[^.]*'
alias lsd='ls -ld *(-/DN)'

alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir -p'

alias rd='rmdir'
alias cd..='cd ..'
alias ..='cd ..'

alias grep='grep --color=auto'
alias dsrm='find . -name ".DS_Store" -exec rm \{} \;'

alias ri='ri -Tf ansi'

# functions
mdc() { mkdir -p "$1" && cd "$1" }
setenv() { export $1=$2 }  # csh compatibility
wiki() { dig +short txt $1.wp.dg.cx; }

# key bindings
bindkey "^[[3~" delete-char
bindkey '^[D' backward-word    # alt + LEFT
bindkey '^[C' forward-word     # alt + RIGHT
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


# Prompt 
BLACK="%{"$'\033[01;30m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

export PS1="${BLUE}%~ ${BOLD}%# ${NORM}"

if [[ -s /Users/oqureshi/.rvm/scripts/rvm ]] ; then source /Users/oqureshi/.rvm/scripts/rvm ; fi