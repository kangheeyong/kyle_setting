sudo git config --global user.email cagojeiger@naver.com
sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install zsh -y
sudo apt-get install zsh-completions -y
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  --unattended 
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo cp .zshrc ~/.zshrc
sudo mkdir /root/tmp
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle 
sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
sudo git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible/
sudo cp -r colors ~/.vim/colors
sudo cp .vimrc ~/.vimrc
sudo apt-get install ctags -y
sudo apt-get install tmux -y
sudo git clone https://github.com/gpakosz/.tmux.git ~/.tmux
sudo ln -s ~/.tmux/.tmux.conf  ~/.tmux.conf
sudo cp ~/.tmux/.tmux.conf.local ~/
