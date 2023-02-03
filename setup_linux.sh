# install zsh (and other bascis) and change shell to zsh
apt-get update
apt-get install curl git zsh
chsh -s `which zsh`

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '/ZSH_THEME/c\ZSH_THEME="powerlevel10k/powerlevel10k"' $HOME/.zshrc

# get p10k config from github
git clone https://github.com/spoiler0/settings.git
mv settings/p10k.zsh $HOME/.p10k.zsh
rm -r settings

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# add plugins to .zshrc
sed -i '/plugins/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' $HOME/.zshrc

# source zsh
source ~/.zshrc
