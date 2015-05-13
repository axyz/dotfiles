# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM=~/.oh-my-zsh/custom/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git axyz archlinux web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

PATH=$PATH:/home/axyz/bin:/home/axyz/.gem/ruby/2.2.0/bin:/home/axyz/.cabal/bin:/home/axyz/app/adt/sdk/platform-tools/
export PATH

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

export GOPATH=~/go

export PATH=$PATH:~/go/bin

export PYTHONPATH=/usr/lib/python3.4/site-packages

export EDITOR='vim'

# export PYTHONPATH=/usr/lib/python3.4/site-packages

# . /usr/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh

bindkey -v

export KEYTIMEOUT=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -S --depth -1 -l -g ""'
