#sudo apt-get update
#sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/esmuellert/material-deep-ocean-zsh/main/.zshrc -O $HOME/.zshrc
wget https://github.com/esmuellert/material-deep-ocean-zsh/raw/main/material_deep_ocean.zsh-theme -O ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/material_deep_ocean.zsh-theme
#sudo chsh -s $(which zsh) $USER
