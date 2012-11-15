# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
# With some mods by anonfunc.
#
# Changes: vcs_info instead of oh-my-zsh lib/git.
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Set vcs_info parameters.
zstyle ':vcs_info:*' disable bzr cdv darcs mtn svk tla
zstyle ':vcs_info:*' enable git svn

zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr "±"
zstyle ':vcs_info:*:*' stagedstr "±"
zstyle ':vcs_info:*:*' actionformats "%b(%a)%u%c"
zstyle ':vcs_info:*:*' formats "%b%u%c"
zstyle ':vcs_info:*:*' nvcsformats ""
zstyle ':vcs_info:*:*' branchformat '%b'

zstyle ':vcs_info:git*+set-message:*' hooks untracked git-color detached
#zstyle ':vcs_info:*+*:*' debug true
add-zsh-hook precmd vcs_info

# Pretty icon for branch/detached head.  Could be inaccurate if your branch name ends in ...
# So don't do that.
function +vi-detached () {
  if [[ ${hook_com[branch]} =~ '\.\.\.$' ]]
  then
    # Same indicates detached head?
    hook_com[branch]="➦ $hook_com[branch_orig]"
  else
    hook_com[branch]="⭠ $hook_com[branch_orig]"
  fi
}

# Set color based on local uncommitted changes
function +vi-git-color () {
  #echo " [[ -n ${hook_com[unstaged]} ||  -n ${hook_com[staged]} ]] "
  if [[ -n ${hook_com[unstaged]} 
    ||  -n ${hook_com[staged]} ]] 
  then
    __git_color=yellow
  else
    __git_color=green
  fi
}

# Check for untracked files as well.  parse_git_dirty from oh-my-zsh/lib/git.zsh
function +vi-untracked () {
  local dirty
  if [[ -z ${hook_com[unstaged_orig]} && -z ${hook_com[staged_orig]} ]]
  then
    dirty=$(parse_git_dirty)
    if [[ -n $dirty ]]
    then
      hook_com[unstaged]="±"
      hook_com[staged]=""
    fi
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  if [[ -n "${vcs_info_msg_0_}" ]] 
  then
    prompt_segment ${__git_color:-green} black 
    echo -n "${vcs_info_msg_0_}"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue black '%~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

# Prompt Continue
prompt_continue() {
  prompt_segment black default "%_"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

#Continuation prompt
build_ps2() {
  prompt_status
  prompt_context
  prompt_dir
  prompt_continue
  prompt_end
}

if [[ "$TERM" -eq "dumb" ]]
then
  PROMPT='$ '
else
  PROMPT='%{%f%b%k%}$(build_prompt) '
  PS2='%{%f%b%k%}$(build_ps2) '
fi
