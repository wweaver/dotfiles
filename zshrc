# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize brew jira osx vagrant more-osx git-flow git-hubflow gitignore)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Load anything that shouldn't be uploaded to public github
. ~/.zsh_secrets

export JIRA_URL=https://pet360.atlassian.net

# aliases
alias v="vagrant"
alias vcd="cd ~/dev/vagrant"
alias vipython="~/dev/python/env/bin/ipython"
alias NFI='cd /Volumes/production/NFI'

# Postgres commands defined in ~/.zsh_secrets
alias pdev="echo $POSTGRES_DEV_CMD; echo; $POSTGRES_DEV_CMD"
alias pprod="echo $POSTGRES_PROD_CMD; echo; $POSTGRES_PROD_CMD"

# Add better zsh help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help


# WorkingOn script
function on() {
    curl -X POST --data-urlencode "task=$*" "https://api.workingon.co/hooks/incoming?token=$WORKING_ON_TOKEN" >/dev/null 2>&1;
    echo "Task sent.";
}


GITDIR=~/git
DEVDIR=~/dev
