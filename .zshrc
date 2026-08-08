# startup config file for zsh shell that runs automatically every time a terminal is opened

eval "$(/opt/homebrew/bin/brew shellenv)" # runs brew shellenv which prints a set of export statements and eval executes that output in the current shell

# facilitate nvm functionality
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

HISTFILE=~/.zsh_history # where historic commands get saved
HISTSIZE=10000 # how many hist lines are kept in mem during a session
SAVEHIST=10000 # how many lines get written to the hist file
setopt SHARE_HISTORY # all open shells share history in real time
setopt HIST_IGNORE_DUPS # doesnt save command if its identical to the preceding one
setopt HIST_IGNORE_SPACE # doesnt save commands that start with a leading space good for sensitive commands
setopt APPEND_HISTORY # appends to the hist file rather than overwriting

# sets default editor programs use when they need to open a text editor
export EDITOR="code -w" # -w makes vs code wait til the tab is closed before letting the calling program continue with whatever its doing
export VISUAL="$EDITOR" # some apps check visual first before editor so just set for peace of mind

autoload -Uz compinit && compinit # load zsh completion system
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # config completion matching to be case insensitive
zstyle ':completion:*' menu select # turns on an interactive arrow key navigable menu with completion options

# command aliases
alias ll="ls -lahG" # detailed list
alias la="ls -A" # "quick" list
alias ..="cd .." # back
alias ...="cd ../.." # double back
alias reload="source ~/.zshrc" # rerun config file
# git specific aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate --all"
alias gco="git checkout"
alias gb="git branch"

# load plugins for auto suggestions and syntax highlighting
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(starship init zsh)" # init starship which will replace the default zsh prompt