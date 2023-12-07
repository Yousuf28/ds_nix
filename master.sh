sh <(curl -L https://nixos.org/nix/install) --daemon --yes
source /etc/profile
echo "source updated"

nix-env -iA vim -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz

nix-env -iA tmux -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA nodejs_20 -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA python310Packages.python -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
# nix-env -iA R -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA nixpkgs.python310Packages.radian
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.fd
nix-env -iA nixpkgs.ripgrep
# clone vim and tmux setup
rm -rf ds_nix_config/
echo 'clone the repo '
git clone https://github.com/Yousuf28/ds_nix.git ~/ds_nix_config
if [ -f .vimrc ]; then
   mv .vimrc .vimrc.bak
fi

if [ -f .tmux.conf ]; then
   mv .tmux.conf .tmux.conf.bak
fi

if [ -f .Rprofile ]; then
   mv .Rprofile .Rprofile.bak
fi
cp ~/ds_nix_config/vimrc ~/.vimrc
cp ~/ds_nix_config/tmux.conf ~/.tmux.conf
cp ~/ds_nix_config/rprofile ~/.Rprofile
# vim plugins manager (:PlugInstall) to install
#
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# prefix and :source-file ~/.tmux.conf
# tmux plugin manager (prefix + I) to install 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# font 
# nix-env -iA nixpkgs.fira-code
# nix-env -iA nixpkgs.meslo-lg
vim +PlugInstall +qa
vim +CocInstall coc-pyright +qa
vim +CocInstall coc-r-lsp +qa
