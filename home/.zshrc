# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Override custom so our config changes don't wind up 
# in the submodule.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple-paster"
#ZSH_THEME="agnoster-mod"
DEFAULT_USER=@first@.@last@

#Tweak for virtualenvwrapper
#export PATH="$PATH:/usr/local/share/python"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git fasd ant screen osx macports brew keychain ruby rbenv work zsh-syntax-highlighting battery )
plugins=(git fasd ant screen osx macports brew keychain ruby work zsh-syntax-highlighting battery )

source $ZSH/oh-my-zsh.sh
export GIT=1

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
