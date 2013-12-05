tma () {
    # cd home
    cd
    # Deactivate virtualenv if active
    if [[ -n "$VIRTUAL_ENV" ]]
    then
        deactivate
    fi

    # How many sessions active?
    SESSIONS=$(tmux list-sessions 2> /dev/null | wc -l)
       # Create a sync'd client session OR create a master session.
    if [[ $SESSIONS == 0 ]]
    then
        tmux -2 new-session -s home
    else
        # Is home attached?
        if tmux list-sessions | grep home: | grep -q attached
        then
            # Attach a new client
            tmux -2 new-session -d -t home -s "client-$$" \;\
                set-option destroy-unattached \; \
                attach-session -t "client-$$"
        else
            # Attach to home.  Home isn't auto-detached, so this isn't perfect.
            tmux -2 attach-session -t home
        fi
    fi
}
