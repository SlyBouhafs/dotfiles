# Defined in - @ line 1
function conf -wraps='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --description 'alias conf=/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv;
end
