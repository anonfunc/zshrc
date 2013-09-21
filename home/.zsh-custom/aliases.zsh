alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) (expand-file-name default-directory))")'

alias tma='tmux -2 new-session -d -t home -s "client-$$" \; set-option destroy-unattached \; attach-session -t "client-$$" || tmux -2 new-session -s home'
alias ta='tmux -2 attach-session -t "home"'

