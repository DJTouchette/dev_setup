main() {
  linux_files="docker.sh
  docker-compose.sh
  zsh-install.sh
  oh-my-zsh.sh
  nvim.sh
  tmux.sh
  vim-plug.sh
  "

  mac_files="docker-mac.sh
  docker-compose-mac.sh
  zsh-install-mac.sh
  oh-my-zsh-mac.sh
  nvim-mac.sh
  tmux-mac.sh
  vim-plug-mac.sh
  "
  unamestr=`uname`

  if [[ "$unamestr" == 'Linux' ]]; then
    for f in $linux_files
      do
        bash "$f"
      done
  elif [[ "$unamestr" == 'Darwin' ]]; then
    for f in $mac_files
      do
        bash "$f"
      done
  fi
}

main
