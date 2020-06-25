function conf_install --description "Setup the dotfiles repo and install global config"
  git clone --bare https://github.com/slybouhafs/dotfiles $HOME/.cfg
  conf checkout
  conf config --local status.showUntrackedFiles no
end
