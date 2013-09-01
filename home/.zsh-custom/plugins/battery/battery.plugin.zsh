battery_percent () {
    if [ $commands[ioreg] ]
    then
        ioreg -rc AppleSmartBattery | awk '/MaxCapacity/ { max = $3 } /CurrentCapacity/ { cur = $3 } END { printf("%2.0f", cur/max * 100) }' 2> /dev/null
    else 
        echo -n "NaN"
    fi
}

battery_colored () {
    PERCENT=`battery_percent`
    if [[ $PERCENT < 20.0 ]]
    then 
        __bat_color=red
    else
        __bat_color=green
    fi
    printf "$fg[$__bat_color]%%%%$PERCENT$reset_color"
}
