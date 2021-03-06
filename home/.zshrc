# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# We want agnoster if and only if we have the font.
# We have the font if we are on darwin, OR we have a ~/.fonts directory

if [[ $OSTYPE == 'linux-gnu' && ! -d ~/.fonts ]]
then
  ZSH_THEME="simple-paster"
else
  ZSH_THEME="simple-paster2"
  #ZSH_THEME="agnoster"
  #ZSH_THEME="bullet-train"
  #ZSH_THEME="philips"
  #ZSH_THEME="bira"
fi
# Custom custom directory
#
ZSH_CUSTOM=$HOME/.zsh-custom

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
plugins=(my-path git zsh-syntax-highlighting fasd dircycle)


if [[ $( uname ) == 'Darwin' ]]
then
  plugins+=(osx brew battery my-mac)
else
  plugins+=(virtualenvwrapper)
fi

plugins+=(pip tmux virtualenv virtualenvwrapper)

plugins+=(ull-completions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [[ -d ~/.rvm ]]
then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
