__git_files () {
    _files $@
}


# Useful bit here:
zstyle ':completion:*:git:*' user-commands ${${(k)commands[(I)git-*]}#git-}
