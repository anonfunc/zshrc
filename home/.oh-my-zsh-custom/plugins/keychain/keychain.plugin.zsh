__keychain_setup () {
    if [ $commands[keychain] ]; then # check for keychain
        eval $(keychain --eval --agents ssh -Q --quiet --ignore-missing id_rsa id_dsa)
    fi
}

__keychain_setup
