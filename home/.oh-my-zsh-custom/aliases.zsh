alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) (expand-file-name default-directory))")'

alias tma='tmux -2 attach -d || tmux -2'

