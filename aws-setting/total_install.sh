sudo passwd root 
sudo cp chsh /etc/pam.d/chsh

sudo apt-get update
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible/
cp -r colors ~/.vim/colors
cp .vimrc ~/.vimrc
sudo apt-get install ctags -y
mkdir /home/ubuntu/tmp

sudo apt-get install zsh -y
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp .zshrc ~/.zshrc
sudo chsh $USER -s $(which zsh)

sudo apt-get install tmux -y
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s ~/.tmux/.tmux.conf  ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/



