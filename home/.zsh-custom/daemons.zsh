echo_bad () {
    TEXT=$1
    shift
    echo $* -e '\e[31m'$TEXT'\e[0m'
}

echo_good () {
    TEXT=$1
    shift
    echo $* -e '\e[32m'$TEXT'\e[0m'
}

isrunning () {
    if [[ -n $(pgrep $1) ]]
    then
        return 0
    fi
    return 1
}

showrunningstatus () {
    for service in $*
    do
        if isrunning $service
        then
            echo_good "$service is running."
        else
            echo_bad "$service is not running."
        fi
    done
}

#showrunningstatus znc btsync
