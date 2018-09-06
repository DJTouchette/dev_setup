git clone https://github.com/DJTouchette/dev_setup ~/dotfiles/
mkdir -p ~/.config/nvim
cp -f -R ~/dotfiles/.config/nvim ~/.config/
cp -f ~/dotfiles/.zshrc ~/.zshrc
cp -f ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

sudo rm -r ~/dotfiles
