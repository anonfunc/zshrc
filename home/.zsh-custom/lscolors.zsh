if [[ $( uname ) == 'Darwin' ]]
then
    export LSCOLORS=exfxcxdxbxegedabagacad
elif [[ -f ~/.dir_colors ]]
    eval `dircolors ~/.dir_colors`
fi
