if [[ $( uname ) == 'Darwin' ]]
then
    export LSCOLORS=exfxcxdxbxegedabagacad
elif [[ -f ~/.dir_colors ]]
then
    eval `dircolors ~/.dir_colors`
fi
