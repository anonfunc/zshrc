tma () {
    # cd home
    cd
    # Deactivate virtualenv if active
    if [[ -n "$VIRTUAL_ENV" ]]
    then
        deactivate
    fi

    # How many sessions active?
       # Create a sync'd client session OR create a master session.
    if tmux list-sessions 2> /dev/null | grep -q home > /dev/null
    then
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
    else
        tmux -2 new-session -s home
    fi
}

tmux_pair () {
  tmux -2 -S /tmp/tmux_socket new-session -d -s pair_home
  chmod ugo+rwx /tmp/tmux_socket
  tmux -2 -S /tmp/tmux_socket attach-session -t home
  rm -f /tmp/tmux_socket
}

tmux_pair_attach () {
  tmux -2 -S /tmp/tmux_socket new-session -d -t pair_home -s "client-$USER" \; set-option destroy-unattached \; attach-session -t "client-$USER"
}
