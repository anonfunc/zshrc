# Put stuff here which is untracked by this public git repo
# If you symlink git user completion stuff, you MUST zcompile it.
# for s in _git-*; do zcompile $s; done

# Useful bit here:
zstyle ':completion:*:git:*' user-commands ${${(k)commands[(I)git-*]}#git-}

autoload +X wd wkill wdnice

# Disable TrendMicro, if exists.

if [[ -f "/Library/Application Support/TrendMicro/TmccMac/iCoreStop.sh" ]]
then
    if ps -u root | grep -q '[i]CoreService'
    then
        echo "Sudo to disable useless TrendMicro."
        sudo "/Library/Application Support/TrendMicro/TmccMac/iCoreStop.sh" 
    fi
    if ps -u $USER | grep -q '[i]CoreService'
    then
    else
        if [[ -f "$HOME/bin/iCoreService" ]]
        then
            # Some things look for a running iCoreService.  Fake it.
            echo "Starting fake TrendMicro"
            sh -c 'nohup ~/bin/iCoreService &'> /tmp/iCoreService-stub
        fi
    fi
fi
