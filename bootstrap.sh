brew install fzf
brew install the_silver_searcher
brew install ranger

ln -sf "$(pwd)/config/nvim" ~/.config
ln -sf "$(pwd)/config/ranger" ~/.config
ln -sf "$(pwd)/config/alacritty" ~/.config
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf

# disable font smoothing in alacritty
default write -org.alacritty AppleFontSmoothing -int 0
