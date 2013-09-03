if [[ -x /usr/bin/keychain ]]
then
	if [[ -f ~/.ssh/${USER}_at_workplace.com_dsa_key ]]
  then
    /usr/bin/keychain ~/.ssh/${USER}_at_workplace.com_dsa_key
    . ~/.keychain/`hostname`-sh
	fi
fi
