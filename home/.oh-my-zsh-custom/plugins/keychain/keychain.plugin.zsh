if [ $commands[keychain] ]; then # check for keychain
    eval $(keychain --eval --agents ssh -Q --quiet)
fi
