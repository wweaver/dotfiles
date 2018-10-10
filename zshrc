# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

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

HOSTNAME=$(hostname);

if [[ $HOSTNAME == Wills-MacBook-Pro.* ]] || [[ $HOSTNAME == Wills-MBP.* ]] || [[ $HOSTNAME == wills-mbp.* ]] || [[ $HOSTNAME == wweaver-MBP ]]; then
    machine_type='main'
else
    machine_type='ssh'
fi

if [[ $machine_type = 'main' ]]; then
    export EDITOR='nvim'
    plugins=(git osx vagrant more-osx git-hubflow gitignore composer httpie git-flow jira node npm sudo wd git-open codeception docker robo)
else
    export EDITOR='vim'
    plugins=(git colorize gitignore)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ $machine_type = 'main' ]]; then
    export PATH="/Users/wweaver/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:.bin/:$PATH:./vendor/bin:./bin:/Users/wweaver/Library/Python/2.7/bin"
    # export MANPATH="/usr/local/man:$MANPATH"

    # You may need to manually set your language environment
    # export LANG=en_US.UTF-8

    # Preferred editor for local and remote sessions

    # Compilation flags
    # export ARCHFLAGS="-arch x86_64"

    # ssh
    # export SSH_KEY_PATH="~/.ssh/dsa_id"

    # Load anything that shouldn't be uploaded to public github
    if [ -e ~/.zsh_secrets ]; then
        . ~/.zsh_secrets
    fi

    export JIRA_URL=https://jira.tripadvisor.com

    # aliases
    alias vi=nvim
    alias vim=nvim
    alias v="vagrant"
    alias vcd="cd ~/git/cruisecritic-vm"
    alias vsh="vcd; vagrant ssh"
    alias colorize="pygmentize -f terminal256 -O style=igor"
    # alias colorize="pygmentize -f terminal256 -O style=vim"
    alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
    alias vipython=". ~/dev/python/venv/bin/activate; ipython; deactivate"
    alias generate_api_key='env LC_CTYPE=C tr -dc "a-z0-9" < /dev/urandom | head -c 64 && echo'
    alias tt='wd trtop'

    # Add better zsh help
    unalias run-help
    autoload run-help
    HELPDIR=/usr/local/share/zsh/help

    GITDIR=~/git


    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init - --no-rehash)" # load rbenv in the current shell

    export NVM_DIR="/Users/wweaver/.nvm"
    #[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    alias activate_nvm="source $NVM_DIR/nvm.sh"

    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc


    # Cancel those terrible ideas Homebrew had of forcing update every 300 s and
    # forcing a 3 s curl on every single run.
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_ANALYTICS=1

    # TA Java
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH=$JAVA_HOME/bin:$PATH
    export PYTHONPATH="$PYTHONPATH:/usr/local/opt/svntr/libexec/lib/python2.7/site-packages"
    export PATH="$PATH:/usr/local/opt/tripant/apache-ant-1.7.0/bin"
    export TRTOP=/Users/wweaver/svn/trsrc-MAINLINE
fi

whiteboard ()
{
    convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
}
