PROMPT=': ${SSH_TTY:+%n@%m }$(virtualenv_prompt_info)%{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}; '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
