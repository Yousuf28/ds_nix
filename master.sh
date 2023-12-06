nix-env -iA vim -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA tmux -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA nodejs_20 -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA python310Packages.python -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA R -f https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz
nix-env -iA nixpkgs.rPackages.languageserver
nix-env -iA nixpkgs.python310Packages.radian

# clone vim and tmux setup
git clone https://github.com/Yousuf28/ds_nix.git ~/ds_nix
if [ -f .vimrc ]; then
   mv .vimrc .vimrc.bak
fi

if [ -f .tmux.conf ]; then
   mv .tmux.conf .tmux.conf.bak
fi
cp ~/ds_nix/vimrc ~/.vimrc
cp ~/ds_nix/tmux.conf ~/.tmux.conf