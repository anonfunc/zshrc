# Prefer Python 2.6 from homebrew
py26path="/usr/local/Cellar/python26/2.6.9/bin"
if [[ -d $py26path ]]
then
  export PATH=$py26path:$PATH
fi
export PATH=$PATH:/usr/local/workplace/bin
