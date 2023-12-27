apt update
sh <(curl -L https://nixos.org/nix/install) --daemon --yes
source /etc/profile

# restart terminal
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.fd
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.emacs29-nox
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
# https://github.com/doomemacs/doomemacs/issues/7292
rm -r .emacs.d/

