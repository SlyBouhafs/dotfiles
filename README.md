# dotfiles
Personal dotfiles for backup

1. Do ` git clone --bare https://github.com/slybouhafs/dotfiles $HOME/.cfg ` OR run ` conf_install.fish `
2. use the ` conf ` command as a git command to add files to repo ex :
``` Shell
conf status
conf add .config/nvim/init.vim
conf commit -m "Add vimrc"
conf push
```

