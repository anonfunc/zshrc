if [[ -f $HOME/.homesick/repos/homeshick/homeshick.sh ]]
then
  source $HOME/.homesick/repos/homeshick/homeshick.sh
  homeshick --quiet refresh
  alias homesick=homeshick
fi
