# Put stuff here which is untracked by this public git repo
# If you symlink git user completion stuff, you MUST zcompile it.
# for s in _git-*; do zcompile $s; done

# Useful bit here:
zstyle ':completion:*:git:*' user-commands ${${(k)commands[(I)git-*]}#git-}

autoload +X wd wkill wdnice

# Disable TrendMicro, if exists.

if [[ -f "/Library/Application Support/TrendMicro/TmccMac/iCoreStop.sh" ]]
then
    echo "Sudo to disable useless TrendMicro."
    sudo "/Library/Application Support/TrendMicro/TmccMac/iCoreStop.sh" 
fi
