brew install fzf
brew install ranger
brew install ripgrep

ln -sf "$(pwd)/config/nvim" ~/.config
ln -sf "$(pwd)/config/ranger" ~/.config
ln -sf "$(pwd)/config/alacritty" ~/.config
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf

# disable font smoothing in alacritty
default write -org.alacritty AppleFontSmoothing -int 0
