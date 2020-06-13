## dotfiles

These are my dotfiles.

## Recreating the environment

- brew
- tmux and attach-to-usernamespace
- zsh
- alacritty
- nvim
- powerline fonts https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
- rustup and cargo

## Base16 Colours

I use the [base16](http://chriskempson.github.io/base16/) theme tomorrow dark.

If you wish to use a different colour, simply change the `colourscheme` in `~/.vimrc` and
the colourspace script loaded in `~/.zshrc.`

## Installation

**Backup your existing dotfiles first.**

1. Clone the repo `git clone --recursive https://github.com/Soliah/dotfiles.git`
2. Run `ruby go.rb`
3. Import the base-16 iTerm2 colour scheme into iTerm2.
4. Launch vim, ignoring any errors, and run `:PlugInstall`.
